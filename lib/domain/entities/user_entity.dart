import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String firstname,
    required String lastname
  }) = _UserEntity;
}
