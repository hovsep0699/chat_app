// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/aliases.dart';
import '../../../core/converter/document_reference_list_converter.dart';

part 'chat_model.g.dart';
part 'chat_model.freezed.dart';

@freezed
class ChatModel with _$ChatModel {
  @JsonSerializable(includeIfNull: false)
  const factory ChatModel(
      {required String id,
      @DocumentReferenceListConverter() required List<FDocumentReference> participants,
      DateTime? lastUpdate,
      @DocumentReferenceListConverter() required List<FDocumentReference> messages}) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}
