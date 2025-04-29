// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(includeIfNull: false)
  const factory UserModel({
    required String uid,
    required String email,
    required String firstname,
    required String lastname
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
      firstname: entity.firstname,
      lastname: entity.lastname,
      uid: entity.id,
      email: entity.email,
  );

  const UserModel._();

  UserEntity toEntity() {
    return UserEntity(
        firstname: firstname,
        lastname: lastname,
        id: uid,
        email: email,
    );
  }
}
