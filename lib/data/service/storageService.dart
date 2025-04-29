import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage();

  // Save token
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  // Read token
  Future<String?> getToken() async {
    return _storage.read(key: 'auth_token');
  }

  // Delete token (e.g., logout)
  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}