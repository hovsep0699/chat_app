import '../../entities/chat/chat_entity.dart';

abstract interface class ChatRepository {
  Stream<ChatEntity?> getChat({required String chatId});
  Stream<List<ChatEntity>> getChats({required String userId});
  Future<String> createChat({required ChatEntity entity});
  Future<void> deleteChat({required String chatId});
}
