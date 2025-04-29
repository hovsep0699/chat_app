import '../../entities/user_entity.dart';

abstract interface class UserRepository {
  Future<List<UserEntity>> getUsers();

  Future<void> saveUserData(UserEntity userEntity);
  Future<UserEntity> getUser({required String userId});
}
