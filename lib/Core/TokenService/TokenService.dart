import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final _storage = const FlutterSecureStorage();
  final _key = 'auth_token';
  final _roleKey = '_roleKey';
  final _profile_id = "profile_id";

  Future<void> saveTokenAndUserType({
    required String token,
    required bool isDoctor,
    required int profile_id,
  }) async {
    await _storage.write(key: _key, value: token);
    await _storage.write(key: _roleKey, value: isDoctor ? 'doctor' : 'patient');
    await _storage.write(key: _profile_id, value: profile_id.toString());
  }

  Future<String?> getProfileId() async {
    return await _storage.read(key: _profile_id);
  }

  Future<String?> getToken() async {
    final token = await _storage.read(key: _key);
    print("token:$token");
    return token;
  }

  Future<bool> isDoctor() async {
    final role = await _storage.read(key: _roleKey);
    return role == 'doctor';
  }

  Future<void> deleteTokenAndUserType() async {
    await _storage.delete(key: _key);
    await _storage.delete(key: _roleKey);
  }

  Future<bool> hasToken() async {
    final token = await _storage.read(key: _key);
     print("token:$token");
    return token != null;
  }
}
