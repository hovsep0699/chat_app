// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageEntity {
  String get id => throw _privateConstructorUsedError;
  UserEntity get sender =>
      throw _privateConstructorUsedError; // Sender reference
  String get message => throw _privateConstructorUsedError;
  DateTime? get lastUpdate => throw _privateConstructorUsedError;
  bool get edited => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageEntityCopyWith<MessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEntityCopyWith<$Res> {
  factory $MessageEntityCopyWith(
          MessageEntity value, $Res Function(MessageEntity) then) =
      _$MessageEntityCopyWithImpl<$Res, MessageEntity>;
  @useResult
  $Res call(
      {String id,
      UserEntity sender,
      String message,
      DateTime? lastUpdate,
      bool edited,
      bool isRead});

  $UserEntityCopyWith<$Res> get sender;
}

/// @nodoc
class _$MessageEntityCopyWithImpl<$Res, $Val extends MessageEntity>
    implements $MessageEntityCopyWith<$Res> {
  _$MessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sender = null,
    Object? message = null,
    Object? lastUpdate = freezed,
    Object? edited = null,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edited: null == edited
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get sender {
    return $UserEntityCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageEntityImplCopyWith<$Res>
    implements $MessageEntityCopyWith<$Res> {
  factory _$$MessageEntityImplCopyWith(
          _$MessageEntityImpl value, $Res Function(_$MessageEntityImpl) then) =
      __$$MessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserEntity sender,
      String message,
      DateTime? lastUpdate,
      bool edited,
      bool isRead});

  @override
  $UserEntityCopyWith<$Res> get sender;
}

/// @nodoc
class __$$MessageEntityImplCopyWithImpl<$Res>
    extends _$MessageEntityCopyWithImpl<$Res, _$MessageEntityImpl>
    implements _$$MessageEntityImplCopyWith<$Res> {
  __$$MessageEntityImplCopyWithImpl(
      _$MessageEntityImpl _value, $Res Function(_$MessageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sender = null,
    Object? message = null,
    Object? lastUpdate = freezed,
    Object? edited = null,
    Object? isRead = null,
  }) {
    return _then(_$MessageEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      edited: null == edited
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MessageEntityImpl implements _MessageEntity {
  const _$MessageEntityImpl(
      {required this.id,
      required this.sender,
      required this.message,
      this.lastUpdate,
      this.edited = false,
      this.isRead = false});

  @override
  final String id;
  @override
  final UserEntity sender;
// Sender reference
  @override
  final String message;
  @override
  final DateTime? lastUpdate;
  @override
  @JsonKey()
  final bool edited;
  @override
  @JsonKey()
  final bool isRead;

  @override
  String toString() {
    return 'MessageEntity(id: $id, sender: $sender, message: $message, lastUpdate: $lastUpdate, edited: $edited, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.edited, edited) || other.edited == edited) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sender, message, lastUpdate, edited, isRead);

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageEntityImplCopyWith<_$MessageEntityImpl> get copyWith =>
      __$$MessageEntityImplCopyWithImpl<_$MessageEntityImpl>(this, _$identity);
}

abstract class _MessageEntity implements MessageEntity {
  const factory _MessageEntity(
      {required final String id,
      required final UserEntity sender,
      required final String message,
      final DateTime? lastUpdate,
      final bool edited,
      final bool isRead}) = _$MessageEntityImpl;

  @override
  String get id;
  @override
  UserEntity get sender; // Sender reference
  @override
  String get message;
  @override
  DateTime? get lastUpdate;
  @override
  bool get edited;
  @override
  bool get isRead;

  /// Create a copy of MessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageEntityImplCopyWith<_$MessageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
