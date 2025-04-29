import '../../core/utils/from_document_reference.dart';
import '../../domain/entities/chat/chat_entity.dart';
import '../../domain/entities/chat/message_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../models/chat/chat_model.dart';
import '../models/chat/message_model.dart';
import '../models/user_model.dart';
import 'message_model_extension.dart';

extension ChatModelToEntity on ChatModel {
  Future<ChatEntity> toEntity() async {
    final participantsEntities = await Future.wait(
      participants.map((ref) => fromDocumentReference<UserEntity>(
          ref: ref, toEntity: (json) => UserModel.fromJson(json).toEntity())),
    );

    final messagesEntities = await Future.wait(
      messages.map((ref) async {
        final messageEntity = await fromDocumentReference<Future<MessageEntity>>(
          ref: ref,
          toEntity: (json) => MessageModel.fromJson(json).toEntity(),
        );
        return messageEntity;
      }),
    );

    return ChatEntity(
      id: id,
      participants: participantsEntities,
      lastUpdate: lastUpdate,
      messages: messagesEntities,
    );
  }
}
