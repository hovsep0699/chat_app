import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di/service_locator.dart';
import 'auth_notifier.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepo = ref.watch(DependencyInjection.authRepositoryProvider);
  final userRepo = ref.watch(DependencyInjection.userRepositoryProvider);
  return AuthNotifier(authRepo, userRepo);
});