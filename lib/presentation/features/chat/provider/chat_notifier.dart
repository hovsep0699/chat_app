
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/chat/chat_entity.dart';
import '../../../../domain/entities/chat/message_entity.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/auth/auth_repository.dart';
import '../../../../domain/repositories/chat/chat_repository.dart';
import '../../../../domain/repositories/message/message_repository.dart';
import '../../../../domain/repositories/user/user_repository.dart';

part 'chat_state.dart';
part 'chat_notifier.freezed.dart';

class ChatNotifier extends StateNotifier<ChatState> {

  ChatNotifier(
      this.chatRepository,
      this.messageRepository,
      this.authRepository,
      this.userRepository,
      ) : super(const ChatState());
  final ChatRepository chatRepository;
  final MessageRepository messageRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;

  Future<void> sendMessage(String chatId, String message) async {
    state = state.copyWith(status: ChatStatus.loading);
    try {
      final user = await authRepository.getLoggedInUser();
      final messageId = await messageRepository.createMessage(
        entity: MessageEntity(
          id: '',
          sender: user!,
          message: message,
          lastUpdate: Timestamp.now().toDate(),
        ),
        chatId: chatId,
      );
      state = state.copyWith(status: ChatStatus.success);
    } catch (e) {
      state = state.copyWith(status: ChatStatus.failure, error: e.toString());
    }
  }

  Future<void> selectChat(String chatId) async {
    try {
      if (chatId.isNotEmpty) {
        await for (final chat in chatRepository.getChat(chatId: chatId)) {
          state = state.copyWith(
            currentChat: chat,
            selectedChatId: chatId,
            status: ChatStatus.success,
          );
        }
      }
    } catch (e) {
      state = state.copyWith(status: ChatStatus.failure, error: e.toString());
    }
  }

  Future<void> createChat(ChatEntity chatEntity) async {
    state = state.copyWith(status: ChatStatus.loading);
    try {
      final currentUser = await authRepository.getLoggedInUser();
      final participants = List<UserEntity>.from(chatEntity.participants);
      participants.add(currentUser!);
      final chatId = await chatRepository.createChat(
        entity: chatEntity.copyWith(participants: participants),
      );
      state = state.copyWith(status: ChatStatus.success, selectedChatId: chatId);
    } catch (e) {
      state = state.copyWith(status: ChatStatus.failure, error: e.toString());
    }
  }

  Future<void> getChats() async {
    state = state.copyWith(status: ChatStatus.loading);
    try {
      final user = await authRepository.getLoggedInUser();
      await for (final chats in chatRepository.getChats(userId: user!.id)) {
        state = state.copyWith(
          status: ChatStatus.success,
          chats: chats,
          filteredChats: chats,
        );
      }
    } catch (e) {
      state = state.copyWith(status: ChatStatus.failure, error: e.toString());
    }
  }

  Future<void> getMessages(String chatId) async {
    state = state.copyWith(status: ChatStatus.loading);
    try {
      await for (final messages in messageRepository.getChatMessages(chatId: chatId)) {
        state = state.copyWith(status: ChatStatus.success, currentMessages: messages);
      }
    } catch (e) {
      state = state.copyWith(status: ChatStatus.failure, error: e.toString());
    }
  }

  Future<void> searchChat(String query) async {
    state = state.copyWith(status: ChatStatus.loading);
    try {
      final users = await userRepository.getUsers();
      bool isSearching = true;
      List<ChatEntity> filteredChats = [];
      List<UserEntity> filteredUsers = [];
      if (query.isEmpty) {
        isSearching = false;
        filteredUsers = [];
        filteredChats = state.chats;
      } else {
        filteredChats = state.chats
            .where((chat) => chat.participants
            .any((user) => user.email.toLowerCase().contains(query.toLowerCase())))
            .toList();
        filteredUsers = users
            .where((user) =>
        user.email.toLowerCase().contains(query.toLowerCase()) &&
            !filteredChats.any((chat) => chat.participants.contains(user)))
            .toList();
      }
      state = state.copyWith(
        users: filteredUsers,
        filteredChats: filteredChats,
        isSearching: isSearching,
        status: ChatStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: ChatStatus.failure, error: e.toString());
    }
  }
}