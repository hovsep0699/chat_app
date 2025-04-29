import '../../core/utils/from_document_reference.dart';
import '../../domain/entities/chat/message_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../models/chat/message_model.dart';
import '../models/user_model.dart';


extension MessageModelToEntity on MessageModel {
  Future<MessageEntity> toEntity() async {
    final senderEntity = await fromDocumentReference<UserEntity>(
        ref: sender, toEntity: (json) => UserModel.fromJson(json).toEntity());

    return MessageEntity(
      id: id,
      sender: senderEntity,
      message: message,
      lastUpdate: lastUpdate,
      edited: edited,
      isRead: isRead,
    );
  }
}
