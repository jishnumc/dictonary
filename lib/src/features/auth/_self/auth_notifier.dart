import 'package:dictonary/src/outer_layer/models/auth/auth_user.dart';
import 'package:dictonary/src/outer_layer/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthUser> build() async {
    final repository = ref.read(authRepositoryProvider);
    return repository.restoreSession();
  }

  void authenticate(AuthUser user) {
    state = AsyncData(user);
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.logout();
      return const AuthUser.unauthenticated();
    });
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
