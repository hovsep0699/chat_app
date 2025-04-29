import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/entities/chat/message_entity.dart';
import '../../../domain/repositories/message/message_repository.dart';
import '../../extensions/future_list_unwrap.dart';
import '../../extensions/message_model_extension.dart';
import '../../models/chat/chat_model.dart';
import '../../models/chat/message_model.dart';
import '../../services/firebase/firebase_service.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl({required this.firebaseService});

  final FirebaseService firebaseService;

  @override
  Future<void> createMessage({required MessageEntity entity, required String chatId}) async {
    if (chatId.isEmpty) {
      throw NotFoundException();
    }
    final docRef = firebaseService.getDocument(firebaseService.userCollectionReference, entity.sender.id);
    final chatRef = firebaseService.getDocument(firebaseService.chatCollectionReference, chatId);
    final messageModel = MessageModel(
        id: '', sender: docRef, message: entity.message, lastUpdate: entity.lastUpdate);
    final doc = await firebaseService.messageCollectionReference.add(messageModel.toJson());
    final messageId = doc.id;

    final updatedChatModel = messageModel.copyWith(id: messageId);

    await docRef.update(updatedChatModel.toJson());
    await chatRef.update({
      'messages': FieldValue.arrayUnion([messageId]),
      'lastUpdate': DateTime.now()
    });
  }

  @override
  Stream<List<MessageEntity>> getChatMessages({required String chatId}) {
    return firebaseService.chatCollectionReference
        .doc(chatId)
        .snapshots()
        .asyncMap((snapshot) async {
      if (!snapshot.exists) {
        throw NotFoundException();
      }

      final chatModel = ChatModel.fromJson(snapshot.data()!);

      final messageFutures = chatModel.messages.map((docRef) async {
        final messageDoc = await docRef.get();
        if (messageDoc.exists) {
          return MessageModel.fromJson(messageDoc.data()!).toEntity();
        }
        return null;
      }).toList();

      final messages = await messageFutures.toListSync();

      return messages.whereType<MessageEntity>().toList();
    });
  }

  @override
  Stream<MessageEntity> getMessage({required String messageId}) {
    return firebaseService.messageCollectionReference
        .doc(messageId)
        .snapshots()
        .asyncMap((snapshot) async {
      if (!snapshot.exists) {
        throw NotFoundException();
      }
      final entity = await MessageModel.fromJson(snapshot.data()!).toEntity();
      return entity;
    });
  }
}
