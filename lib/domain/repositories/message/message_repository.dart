import '../../entities/chat/message_entity.dart';

abstract interface class MessageRepository {
  Stream<MessageEntity> getMessage({required String messageId});
  Future<void> createMessage({required MessageEntity entity, required String chatId});
  Stream<List<MessageEntity>> getChatMessages({required String chatId});
}
