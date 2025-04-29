// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as String,
      sender: const DocumentReferenceConverter()
          .fromJson(json['sender'] as DocumentReference<Map<String, dynamic>>),
      message: json['message'] as String,
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
      edited: json['edited'] as bool? ?? false,
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': const DocumentReferenceConverter().toJson(instance.sender),
      'message': instance.message,
      if (instance.lastUpdate?.toIso8601String() case final value?)
        'lastUpdate': value,
      'edited': instance.edited,
      'isRead': instance.isRead,
    };
