import '../constants/aliases.dart';
import '../exceptions/exceptions.dart';

/// Generic method to convert Firestore DocumentReference to an Model.
Future<T> fromDocumentReference<T>(
    {required FDocumentReference ref, required T Function(Map<String, dynamic>) toEntity}) async {
  final docSnapshot = await ref.get();

  if (docSnapshot.exists) {
    final data = docSnapshot.data()!;

    return toEntity(data);
  } else {
    throw NotFoundException();
  }
}
