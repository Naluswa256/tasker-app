import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'firebase_providers.g.dart';



@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}


@riverpod
GoogleSignIn getGoogleSignInInstance( GetGoogleSignInInstanceRef ref) {
  return GoogleSignIn();
}
@riverpod
FirebaseFirestore getFirestoreInstance(GetFirestoreInstanceRef ref) {
  return FirebaseFirestore.instance;
}



