import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final _storage = const FlutterSecureStorage();
  final _key = 'auth_token';
  final _roleKey = '_roleKey';

  Future<void> saveTokenAndUserType(String token,bool isDoctor) async {
    await _storage.write(key: _key, value: token);
    await _storage.write(key: _roleKey, value: isDoctor ? 'doctor' : 'patient');

  }

  Future<String?> getToken() async {
    return await _storage.read(key: _key);
  }
    Future<bool>  isDoctor() async {
    final role = await _storage.read(key: _roleKey);
    return role == 'doctor';
  }

  Future<void> deleteTokenAndUserType() async {
    await _storage.delete(key: _key);
       await _storage.delete(key: _roleKey);
  }

  Future<bool> hasToken() async {
    final token = await _storage.read(key: _key);
    return token != null;
  }
}
