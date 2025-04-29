import '../../../core/constants/aliases.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/user/user_repository.dart';
import '../../models/user_model.dart';
import '../../services/firebase/firebase_service.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.firebaseService});
  final FirebaseService firebaseService;

  @override
  Future<List<UserEntity>> getUsers() async {
   final userSnapshots = await firebaseService.userCollectionReference.get();
   final users = userSnapshots.docs.map((doc)=>  UserModel.fromJson(doc.data()).toEntity()).toList();
   return users;
  }

  @override
  Future<void> saveUserData(UserEntity userEntity) async {
    if (userEntity.id.isEmpty) {
      throw NotFoundException();
    }
    final FDocumentReference documentReference = firebaseService.getDocument(
      firebaseService.userCollectionReference,
      userEntity.id,
    );
    if (!(await documentReference.get()).exists) {
      await documentReference.set(UserModel.fromEntity(userEntity).toJson());
    } else {
      await documentReference.update(UserModel.fromEntity(userEntity).toJson());
    }
  }

  @override
  Future<UserEntity> getUser({required String userId}) async {
    if (userId.isEmpty) {
      throw NotFoundException();
    }
    final userSnapshot = await firebaseService.getDocument(
      firebaseService.userCollectionReference,
      userId,
    ).get();
    if (!userSnapshot.exists) {
      throw NotFoundException();
    }
    return UserModel.fromJson(userSnapshot.data()!).toEntity();
  }
}
