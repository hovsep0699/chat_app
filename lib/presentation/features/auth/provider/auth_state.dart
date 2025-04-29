part of 'auth_notifier.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unauthenticated) AuthStatus status,
    @Default(UserStatus.initial) UserStatus userStatus,
    UserEntity? user,
    String? error,
  }) = _Initial;
}

enum UserStatus { initial, loading, success, failure }

enum AuthStatus { unauthenticated, authenticated }
