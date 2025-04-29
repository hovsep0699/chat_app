// ignore_for_file: invalid_annotation_target
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/aliases.dart';
import '../../../core/converter/document_reference_converter.dart';

part 'message_model.g.dart';
part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(includeIfNull: false)
  const factory MessageModel({
    required String id,
    @DocumentReferenceConverter() required FDocumentReference sender, // Sender reference
    required String message,
    DateTime? lastUpdate,
    @Default(false) bool edited,
    @Default(false) bool isRead,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
