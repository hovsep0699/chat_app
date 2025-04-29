
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../di/service_locator.dart';
import 'chat_notifier.dart';

final chatNotifierProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  final chatRepository = ref.read(DependencyInjection.chatRepositoryProvider);
  final messageRepository = ref.read(DependencyInjection.messageRepositoryProvider);
  final authRepository = ref.read(DependencyInjection.authRepositoryProvider);
  final userRepository = ref.read(DependencyInjection.userRepositoryProvider);

  return ChatNotifier(
    chatRepository,
    messageRepository,
    authRepository,
    userRepository,
  );
});
