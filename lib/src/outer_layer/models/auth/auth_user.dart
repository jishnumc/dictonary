import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// Represents the authenticated user state.
@freezed
sealed class AuthUser with _$AuthUser {
  const factory AuthUser.authenticated({
    required String id,
    required String username,
  }) = _Authenticated;

  const factory AuthUser.unauthenticated() = _Unauthenticated;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}

extension AuthUserX on AuthUser {
  bool get isAuth => this is _Authenticated;
}
