part of 'chat_notifier.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ChatStatus.initial) status,
    @Default([]) List<ChatEntity> chats,
    @Default([]) List<ChatEntity> filteredChats,
    @Default([]) List<UserEntity> users,
    ChatEntity? currentChat,
    String? selectedChatId,
    @Default([]) List<MessageEntity> currentMessages,
    @Default(false) bool isSearching,
    String? error
  }) = _Initial;
}

enum ChatStatus {initial, loading, failure, success}
