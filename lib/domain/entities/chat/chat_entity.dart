
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_entity.dart';
import 'message_entity.dart';

part 'chat_entity.freezed.dart';

@freezed
class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    required String id,
    required List<UserEntity> participants,
    DateTime? lastUpdate,
    required List<MessageEntity> messages
  }) = _ChatEntity;
}