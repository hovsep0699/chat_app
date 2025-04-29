import '../../../core/exceptions/exceptions.dart';
import '../../../domain/entities/chat/chat_entity.dart';
import '../../../domain/repositories/chat/chat_repository.dart';
import '../../extensions/chat_model_extension.dart';
import '../../extensions/future_list_unwrap.dart';
import '../../models/chat/chat_model.dart';
import '../../services/firebase/firebase_service.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({required this.firebaseService});

  final FirebaseService firebaseService;

  @override
  Future<String> createChat({required ChatEntity entity}) async {
    bool isExists = true;
    final users = await entity.participants
        .map((e) async {
          final ref = firebaseService.getDocument(firebaseService.userCollectionReference, e.id);
          final doc = await ref.get();
          if (!doc.exists) {
            isExists = false;
          }
          return ref;
        })
        .toList()
        .toListSync();
    if (users.isEmpty || !isExists) {
      throw NotFoundException();
    }
    final chatModel =
        ChatModel(id: '', participants: users, lastUpdate: entity.lastUpdate, messages: []);
    final docRef = await firebaseService.chatCollectionReference.add(chatModel.toJson());
    final chatId = docRef.id;

    final updatedChatModel = chatModel.copyWith(id: chatId);

    await docRef.update(updatedChatModel.toJson());
    return chatId;
  }

  @override
  Future<void> deleteChat({required String chatId}) async {
    final snapshot = firebaseService.getDocument(firebaseService.chatCollectionReference, chatId);
    await snapshot.delete();
  }

  @override
  Stream<ChatEntity?> getChat({required String chatId}) {
    return firebaseService
        .getDocument(firebaseService.chatCollectionReference, chatId)
        .snapshots()
        .asyncMap((snapshot) async {
      if (!snapshot.exists) {
        return null;
      }
      return ChatModel.fromJson(snapshot.data()!).toEntity();
    });
  }

  @override
  Stream<List<ChatEntity>> getChats({required String userId}) async* {
    try {
      final userRef = firebaseService.getDocument(firebaseService.userCollectionReference, userId);
      final chatSnapshots = firebaseService.chatCollectionReference
          .where('participants', arrayContainsAny: [userRef]).snapshots();
      await for (final snapshot in chatSnapshots) {
        final chats = await snapshot.docs
            .map((doc) async {
              print("KKK::: ${doc.data()['participants'].runtimeType}");
              final chatModel = ChatModel.fromJson(doc.data());

              return chatModel.toEntity();
            })
            .toList()
            .toListSync();

        yield chats;
      }
    } catch (e, stacktrace) {
      print('Error fetching chats: $e $stacktrace');
      yield [];
    }
  }
}
