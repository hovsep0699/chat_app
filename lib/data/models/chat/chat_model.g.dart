// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['id'] as String,
      participants: const DocumentReferenceListConverter()
          .fromJson(json['participants'] as List),
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
      messages: const DocumentReferenceListConverter()
          .fromJson(json['messages'] as List),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participants':
          const DocumentReferenceListConverter().toJson(instance.participants),
      if (instance.lastUpdate?.toIso8601String() case final value?)
        'lastUpdate': value,
      'messages':
          const DocumentReferenceListConverter().toJson(instance.messages),
    };
