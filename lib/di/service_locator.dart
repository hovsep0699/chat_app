import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/repositories/chat/chat_repository_impl.dart';
import '../data/repositories/message/message_repository_impl.dart';
import '../data/repositories/user/user_repository_impl.dart';
import '../data/services/firebase/firebase_serivce_impl.dart';
import '../data/services/firebase/firebase_service.dart';
import '../domain/repositories/auth/auth_repository.dart';
import '../domain/repositories/chat/chat_repository.dart';
import '../domain/repositories/message/message_repository.dart';
import '../domain/repositories/user/user_repository.dart';

class DependencyInjection {
  static final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
    return FirebaseAuth.instance;
  });

  static final firestoreProvider = Provider<FirebaseFirestore>((ref) {
    return FirebaseFirestore.instance;
  });

  static final firebaseServiceProvider = Provider<FirebaseService>((ref) {
    final auth = ref.watch(firebaseAuthProvider);
    final firestore = ref.watch(firestoreProvider);
    return FirebaseServiceImpl(auth: auth, firestore: firestore);
  });

  static final authRepositoryProvider = Provider<AuthRepository>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return AuthRepositoryImpl(firebaseService: firebaseService);
  });

  static final chatRepositoryProvider = Provider<ChatRepository>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return ChatRepositoryImpl(firebaseService: firebaseService);
  });

  static final userRepositoryProvider = Provider<UserRepository>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return UserRepositoryImpl(firebaseService: firebaseService);
  });

  static final messageRepositoryProvider = Provider<MessageRepository>((ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return MessageRepositoryImpl(firebaseService: firebaseService);
  });
}
