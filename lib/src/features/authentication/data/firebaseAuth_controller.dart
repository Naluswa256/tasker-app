// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuunganatask/src/features/authentication/data/firebaseAuth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:go_router/go_router.dart";
import '../../../utils/utils.dart';
import '../domain/user_model.dart';
part 'firebaseAuth_controller.g.dart';

class FirebaseAuthController extends StateNotifier<bool> {
  final Ref _ref;
  final FirebaseAuthRepository _firebaseAuthRepository;

  FirebaseAuthController(
      {required FirebaseAuthRepository firebaseAuthRepository,
      required Ref ref})
      : _ref = ref,
        _firebaseAuthRepository = firebaseAuthRepository,
        super(false);

  void createUserWithEmailandPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final result = await _firebaseAuthRepository.createUserWithEmailAndPassword(
        email, password);
    state = false;
    navigateToLogin() {
      (context).go('/login');
    }
    

    result.fold((l) => displaySnackBar(context, l.errorMessage), (_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('first_time', false);
      await prefs.setBool('signup_complete', true);
      navigateToLogin();
    });
  }

  Stream<UserModel> fetchUserData(String uid) =>
      _firebaseAuthRepository.fetchUserData(uid);

  void siginUserWithEmailandPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final result = await _firebaseAuthRepository.signinUserWithEmailAndPassword(
        email, password);

    state = false;
    navigateToDashboard() {
      (context).go('/dashboard');
    }

    result.fold((l) => displaySnackBar(context, l.errorMessage), (userModel) async {
      _ref.watch(userProvider.notifier).update((state) => userModel);
       SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('first_time', false);
      await prefs.setBool('login_complete', true);
      navigateToDashboard();
    });
  }

  void siginUserWithGoogleAccount(BuildContext context) async {
    state = true;
    final result = await _firebaseAuthRepository.signInWithGoogle();

    state = false;
    result.fold(
        (l) => displaySnackBar(context, l.errorMessage),
        (userModel) =>
            _ref.watch(userProvider.notifier).update((state) => userModel));
  }
}

final firebaseAuthControllerProvider =
    StateNotifierProvider<FirebaseAuthController, bool>((ref) =>
        FirebaseAuthController(
            firebaseAuthRepository: ref.read(firebaseRepositoryProvider),
            ref: ref));

@riverpod
Stream<UserModel> fetchUserData(FetchUserDataRef ref, String uid) {
  final firebaseAuthController =
      ref.read(firebaseAuthControllerProvider.notifier);
  return firebaseAuthController.fetchUserData(uid);
}

final userProvider = StateProvider<UserModel?>((ref) {
  return null;
});
