import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../models/user_model.dart';
import '../../services/firebase/firebase_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.firebaseService});

  final FirebaseService firebaseService;

  @override
  Future<void> logout() async => firebaseService.logout();

  @override
  Future<String> signInWithEmailPassword(String email, String password) async {
    final credential = await firebaseService.signInWithEmailPassword(email, password);
    return credential.user?.uid ?? '';
  }

  @override
  Future<String> signUpWithEmailPassword(String email, String password) async {
    final credential = await firebaseService.signUpWithEmailPassword(email, password);
    return credential.user?.uid ?? '';
  }

  @override
  Future<UserEntity?> getLoggedInUser() async {
    final user = await firebaseService.getLoggedInUser();
    if (user == null) {
      return null;
    }
    final documentReference = firebaseService.getDocument(
      firebaseService.userCollectionReference,
      user.uid,
    );
    final snapshot = await documentReference.get();
    return snapshot.data() == null ? null : UserModel.fromJson(snapshot.data()!).toEntity();
  }
}
