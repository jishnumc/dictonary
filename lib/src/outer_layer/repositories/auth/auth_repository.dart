import 'package:dictonary/src/outer_layer/models/auth/auth_user.dart';
import 'package:dictonary/src/outer_layer/models/auth/credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  Future<AuthUser> restoreSession() async {
    // Delay to simulate disk/network read
    await Future<void>.delayed(const Duration(milliseconds: 500));
    // For now, default to unauthenticated
    return const AuthUser.unauthenticated();
  }

  /// Simulates logging in against a backend.
  Future<AuthUser> login(Credentials credentials) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (credentials.username.isEmpty || credentials.password.isEmpty) {
      throw Exception('Invalid credentials');
    }
    return AuthUser.authenticated(
      id: 'usr_12345',
      username: credentials.username,
    );
  }

  /// Simulates logging out and clearing session data.
  Future<void> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}
