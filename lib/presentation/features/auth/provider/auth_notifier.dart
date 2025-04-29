import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/auth/auth_repository.dart';
import '../../../../domain/repositories/user/user_repository.dart';
import '../../../../l10n/localizations_utils.dart';

part 'auth_state.dart';
part 'auth_notifier.freezed.dart';


class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.authRepository, this.userRepository) : super(const AuthState());

  final AuthRepository authRepository;
  final UserRepository userRepository;

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(userStatus: UserStatus.loading);
      final userId = await authRepository.signInWithEmailPassword(email, password);
      bool isSuccess = false;
      UserEntity? user = await authRepository.getLoggedInUser();
      if (userId.isNotEmpty && user != null) {
        isSuccess = true;
      } else {
        await authRepository.logout();
        user = null;
      }
      state = state.copyWith(
        status: isSuccess ? AuthStatus.authenticated : AuthStatus.unauthenticated,
        userStatus: isSuccess ? UserStatus.success : UserStatus.failure,
        user: user,
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
          userStatus: UserStatus.failure,
          error: e.message ?? appLocalizations.lblLoginFailed);
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.failure, error: e.toString());
    }
  }

  Future<void> signUp(String email, String password, String firstname, String lastname) async {
    try {
      state = state.copyWith(userStatus: UserStatus.loading);
      final userId = await authRepository.signUpWithEmailPassword(email, password);
      if (userId.isNotEmpty) {
        await userRepository.saveUserData(UserEntity(
          id: userId,
          email: email,
          firstname: firstname,
          lastname: lastname,
        ));
        state = state.copyWith(userStatus: UserStatus.success);
      } else {
        state = state.copyWith(userStatus: UserStatus.failure);
      }
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
          userStatus: UserStatus.failure,
          error: e.message ?? appLocalizations.lblUnableSignup);
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.failure, error: e.toString());
    }
  }

  Future<void> saveUserData(UserEntity userEntity) async {
    try {
      state = state.copyWith(userStatus: UserStatus.loading);
      await userRepository.saveUserData(userEntity);
      state = state.copyWith(user: userEntity, userStatus: UserStatus.success);
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.failure, error: e.toString());
    }
  }

  Future<void> getUserData() async {
    try {
      state = state.copyWith(userStatus: UserStatus.loading);
      final user = await authRepository.getLoggedInUser();
      state = state.copyWith(
        user: user,
        userStatus: UserStatus.success,
        status: user != null ? AuthStatus.authenticated : AuthStatus.unauthenticated,
      );
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.failure, error: e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await authRepository.logout();
      state = const AuthState(); // Reset to default
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
          userStatus: UserStatus.failure,
          error: e.message ?? appLocalizations.lblLoginFailed);
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.failure, error: e.toString());
    }
  }

  void resetAfterSubmit() {
    state = state.copyWith(userStatus: UserStatus.initial);
  }
}
