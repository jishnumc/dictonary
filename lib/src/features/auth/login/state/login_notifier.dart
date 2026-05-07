import 'package:dictonary/src/features/auth/_self/auth_notifier.dart';
import 'package:dictonary/src/features/auth/login/models/login_validation.dart';
import 'package:dictonary/src/outer_layer/models/auth/credentials.dart';
import 'package:dictonary/src/outer_layer/repositories/auth/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.freezed.dart';
part 'login_notifier.g.dart';

/// Local form state tracking for the Auth flow.
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String username,
    @Default('') String password,
    @Default(false) bool isLoggingIn,
    @Default('') String errorMessage,
  }) = _LoginState;
}

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    return const LoginState();
  }

  void updateUsername(String username) {
    state = state.copyWith(username: username);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  ValidationResult validateEmail(String email) {
    if (email.isEmpty) return const Invalid('Email cannot be empty');
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return const Invalid('Invalid email format');
    return const Valid();
  }

  ValidationResult validatePassword(String password) {
    if (password.isEmpty) return const Invalid('Password cannot be empty');
    if (password.length < 6) {
      return const Invalid('Password must be at least 6 characters');
    }
    return const Valid();
  }

  Future<void> login() async {
    final emailValidation = validateEmail(state.username);
    final passwordValidation = validatePassword(state.password);

    if (emailValidation is Invalid || passwordValidation is Invalid) {
      state = state.copyWith(errorMessage: 'Please fix the errors above');
      return;
    }

    final repository = ref.read(authRepositoryProvider);
    state = state.copyWith(isLoggingIn: true, errorMessage: '');

    try {
      // Explicit requested delay for loader visibility
      await Future<void>.delayed(const Duration(seconds: 1));

      final user = await repository.login(
        Credentials(username: state.username, password: state.password),
      );
      // Update the global auth state upon successful login
      ref.read(authProvider.notifier).authenticate(user);
      state = state.copyWith(isLoggingIn: false);
    } on Exception catch (e) {
      state = state.copyWith(isLoggingIn: false, errorMessage: e.toString());
    }
  }
}
