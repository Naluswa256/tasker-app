// ignore_for_file: file_names

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../exceptions/failure.dart';
import '../../../utils/firebase_providers.dart';
import '../../../utils/typedef.dart';
import '../domain/user_model.dart';
part 'firebaseAuth_repository.g.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuthInstance;
  final GoogleSignIn _googleSignInInstance;
  final FirebaseFirestore _firebaseFirestoreInstance;

  const FirebaseAuthRepository(
      {required FirebaseAuth firebaseAuthInstance,
      required GoogleSignIn googleSigninInstance,
      required FirebaseFirestore firebaseFirestoreInstance})
      : _firebaseAuthInstance = firebaseAuthInstance,
        _googleSignInInstance = googleSigninInstance,
        _firebaseFirestoreInstance = firebaseFirestoreInstance;

  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await _googleSignInInstance.signIn();
      final googleAuth = await googleUser?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final userCredentials =
          await _firebaseAuthInstance.signInWithCredential(credentials);

      UserModel userModel;

      if (userCredentials.additionalUserInfo!.isNewUser) {
        final email = userCredentials.user!.email!;
        final nameFromEmail =
            email.substring(0, email.indexOf('@')).toLowerCase();
        userModel = UserModel(
            userDisplayName: nameFromEmail,
            userPersonalEmail: email,
            userPhoneNumber: '',
            uid: userCredentials.user!.uid,
            userProfilePic: 'https://www.woolha.com/media/2020/03/eevee.png');
        final userRef = _firebaseFirestoreInstance
            .collection('users')
            .doc(userCredentials.user!.uid);

        await userRef.set(userModel.toJson());
      } else {
        userModel = await fetchUserData(userCredentials.user!.uid).first;
      }

      return right(userModel);
    } on FirebaseException catch (e) {
      return Left(Failure(errorMessage: e.message!));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  FutureVoid createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure(errorMessage: e.message!));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  Stream<UserModel> fetchUserData(String uid) {
    // Fetch the user document from Firestore and map it to UserModel object
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((snapshot) =>
            UserModel.fromJson(snapshot.data() as Map<String, Object?>));
  }

  FutureEither<UserModel> signinUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      // final userModel = await _fetchUser(userCredential.user!.uid);
      final UserModel userModel;
      final userRef = _firebaseFirestoreInstance
          .collection('users')
          .doc(userCredential.user!.uid);
      final userDoc = await userRef.get();

      if (userDoc.exists) {
        userModel = await _fetchUser(userCredential.user!.uid, userRef);
      } else {
        final nameFromEmail =
            email.substring(0, email.indexOf('@')).toLowerCase();
        final newUser = UserModel(
            userDisplayName: nameFromEmail,
            userPersonalEmail: email,
            userPhoneNumber: '',
            uid: userCredential.user!.uid,
            userProfilePic: 'https://www.woolha.com/media/2020/03/eevee.png');
        await userRef.set(newUser.toJson());
        userModel = newUser;
      }
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(errorMessage: e.message!));
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future<UserModel> _fetchUser(String userId, DocumentReference userRef) async {
    final userDoc = await userRef.get();
    final userModel =
        UserModel.fromJson(userDoc.data() as Map<String, Object?>);
    return userModel;
  }

  FutureVoid sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuthInstance.sendPasswordResetEmail(
        email: email,
      );
      return right(null);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  FutureEither<bool> verifyPasswordResetOTP(String email, String otp) async {
    try {
      ActionCodeInfo info = await _firebaseAuthInstance.checkActionCode(otp);
      if (info.data['email'] == email) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  FutureVoid resetPassword(String otp, String password) async {
    try {
      await _firebaseAuthInstance.confirmPasswordReset(
        code: otp,
        newPassword: password,
      );
      return right(null);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}

@riverpod
FirebaseAuthRepository firebaseRepository(FirebaseRepositoryRef ref) {
  return FirebaseAuthRepository(
      firebaseAuthInstance: ref.read(firebaseAuthProvider),
      firebaseFirestoreInstance: ref.read(getFirestoreInstanceProvider),
      googleSigninInstance: ref.read(getGoogleSignInInstanceProvider));
}
