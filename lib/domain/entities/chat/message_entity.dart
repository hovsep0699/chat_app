// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/aliases.dart';
import '../../../core/converter/document_reference_converter.dart';
import '../user_entity.dart';

part 'message_entity.freezed.dart';


@freezed
class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String id,
    required UserEntity sender, // Sender reference
    required String message,
    DateTime? lastUpdate,
    @Default(false) bool edited,
    @Default(false) bool isRead,
  }) = _MessageEntity;

}
