import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants/aliases.dart';

abstract interface class FirebaseService {
  Future<UserCredential> signInWithEmailPassword(String email, String password);
  Future<UserCredential> signUpWithEmailPassword(String email, String password);
  Future<void> logout();
  Future<User?> getLoggedInUser();
  FDocumentReference getDocument(FCollectionReference reference, String docId);
  Future<AuthCredential> reAuthenticateUser(String email, String password);
  FCollectionReference get userCollectionReference;
  FCollectionReference get chatCollectionReference;
  FCollectionReference get messageCollectionReference;
}
