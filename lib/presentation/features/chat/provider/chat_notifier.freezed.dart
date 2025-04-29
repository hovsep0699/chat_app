// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  dynamic get status => throw _privateConstructorUsedError;
  List<ChatEntity> get chats => throw _privateConstructorUsedError;
  List<ChatEntity> get filteredChats => throw _privateConstructorUsedError;
  List<UserEntity> get users => throw _privateConstructorUsedError;
  ChatEntity? get currentChat => throw _privateConstructorUsedError;
  String? get selectedChatId => throw _privateConstructorUsedError;
  List<MessageEntity> get currentMessages => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {dynamic status,
      List<ChatEntity> chats,
      List<ChatEntity> filteredChats,
      List<UserEntity> users,
      ChatEntity? currentChat,
      String? selectedChatId,
      List<MessageEntity> currentMessages,
      bool isSearching,
      String? error});

  $ChatEntityCopyWith<$Res>? get currentChat;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? chats = null,
    Object? filteredChats = null,
    Object? users = null,
    Object? currentChat = freezed,
    Object? selectedChatId = freezed,
    Object? currentMessages = null,
    Object? isSearching = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      filteredChats: null == filteredChats
          ? _value.filteredChats
          : filteredChats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentChat: freezed == currentChat
          ? _value.currentChat
          : currentChat // ignore: cast_nullable_to_non_nullable
              as ChatEntity?,
      selectedChatId: freezed == selectedChatId
          ? _value.selectedChatId
          : selectedChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentMessages: null == currentMessages
          ? _value.currentMessages
          : currentMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageEntity>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatEntityCopyWith<$Res>? get currentChat {
    if (_value.currentChat == null) {
      return null;
    }

    return $ChatEntityCopyWith<$Res>(_value.currentChat!, (value) {
      return _then(_value.copyWith(currentChat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic status,
      List<ChatEntity> chats,
      List<ChatEntity> filteredChats,
      List<UserEntity> users,
      ChatEntity? currentChat,
      String? selectedChatId,
      List<MessageEntity> currentMessages,
      bool isSearching,
      String? error});

  @override
  $ChatEntityCopyWith<$Res>? get currentChat;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? chats = null,
    Object? filteredChats = null,
    Object? users = null,
    Object? currentChat = freezed,
    Object? selectedChatId = freezed,
    Object? currentMessages = null,
    Object? isSearching = null,
    Object? error = freezed,
  }) {
    return _then(_$InitialImpl(
      status: freezed == status ? _value.status! : status,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      filteredChats: null == filteredChats
          ? _value._filteredChats
          : filteredChats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentChat: freezed == currentChat
          ? _value.currentChat
          : currentChat // ignore: cast_nullable_to_non_nullable
              as ChatEntity?,
      selectedChatId: freezed == selectedChatId
          ? _value.selectedChatId
          : selectedChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentMessages: null == currentMessages
          ? _value._currentMessages
          : currentMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageEntity>,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = ChatStatus.initial,
      final List<ChatEntity> chats = const [],
      final List<ChatEntity> filteredChats = const [],
      final List<UserEntity> users = const [],
      this.currentChat,
      this.selectedChatId,
      final List<MessageEntity> currentMessages = const [],
      this.isSearching = false,
      this.error})
      : _chats = chats,
        _filteredChats = filteredChats,
        _users = users,
        _currentMessages = currentMessages;

  @override
  @JsonKey()
  final dynamic status;
  final List<ChatEntity> _chats;
  @override
  @JsonKey()
  List<ChatEntity> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  final List<ChatEntity> _filteredChats;
  @override
  @JsonKey()
  List<ChatEntity> get filteredChats {
    if (_filteredChats is EqualUnmodifiableListView) return _filteredChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredChats);
  }

  final List<UserEntity> _users;
  @override
  @JsonKey()
  List<UserEntity> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final ChatEntity? currentChat;
  @override
  final String? selectedChatId;
  final List<MessageEntity> _currentMessages;
  @override
  @JsonKey()
  List<MessageEntity> get currentMessages {
    if (_currentMessages is EqualUnmodifiableListView) return _currentMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentMessages);
  }

  @override
  @JsonKey()
  final bool isSearching;
  @override
  final String? error;

  @override
  String toString() {
    return 'ChatState(status: $status, chats: $chats, filteredChats: $filteredChats, users: $users, currentChat: $currentChat, selectedChatId: $selectedChatId, currentMessages: $currentMessages, isSearching: $isSearching, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            const DeepCollectionEquality()
                .equals(other._filteredChats, _filteredChats) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.currentChat, currentChat) ||
                other.currentChat == currentChat) &&
            (identical(other.selectedChatId, selectedChatId) ||
                other.selectedChatId == selectedChatId) &&
            const DeepCollectionEquality()
                .equals(other._currentMessages, _currentMessages) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_chats),
      const DeepCollectionEquality().hash(_filteredChats),
      const DeepCollectionEquality().hash(_users),
      currentChat,
      selectedChatId,
      const DeepCollectionEquality().hash(_currentMessages),
      isSearching,
      error);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ChatState {
  const factory _Initial(
      {final dynamic status,
      final List<ChatEntity> chats,
      final List<ChatEntity> filteredChats,
      final List<UserEntity> users,
      final ChatEntity? currentChat,
      final String? selectedChatId,
      final List<MessageEntity> currentMessages,
      final bool isSearching,
      final String? error}) = _$InitialImpl;

  @override
  dynamic get status;
  @override
  List<ChatEntity> get chats;
  @override
  List<ChatEntity> get filteredChats;
  @override
  List<UserEntity> get users;
  @override
  ChatEntity? get currentChat;
  @override
  String? get selectedChatId;
  @override
  List<MessageEntity> get currentMessages;
  @override
  bool get isSearching;
  @override
  String? get error;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
