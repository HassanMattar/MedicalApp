import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/Auth/data/models/UserModel.dart';
import '../../domain/entities/Users.dart';

abstract class AuthRemoteDataSource {
  Future<bool> changePassword();
  Future<User> login({required String email, required String password});
  Future<bool> signUp({
    required String name,
    required String password,
    required String email,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<bool> changePassword() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final response = await DioHelper.postData(
        url: "/token/",
        data: {
  "email": "44@gmail.com",
  "password": "47"
},
      );
      print("response:____________-_ $response");
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw InvalidEmailOrPasswordException();
      }
    } catch (err) {
      print("*******$err ***************");
      throw InvalidEmailOrPasswordException();
    }
  }

  @override
  Future<bool> signUp({
    required String name,
    required String password,
    required String email,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: "/users/",
        data: {
          "password": "12055",
          "full_name": "ibqqraheem",
          "email": "44wwwwwcom",
        },
      );
      print(response);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw DataErrorException();
      }
    } catch (err) {
      print(err);
      throw DataErrorException();
    }
  }
}
