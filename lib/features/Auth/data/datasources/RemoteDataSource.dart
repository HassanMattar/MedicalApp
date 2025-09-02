import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/Auth/data/models/UserModel.dart';
import '../../domain/entities/Users.dart';

abstract class AuthRemoteDataSource {
  Future<bool> changePassword();
  Future<UserEntity> login({required String email, required String password});
  Future<bool> signUp({
    required String name,
    required String password,
    required String email,
     required String isDoctor,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<bool> changePassword() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    try {
      final response = await DioHelper.postData(
        url: "/token/auth/",
        data: {
  "username_or_email": email,
  "password": password
},
    );
      print("*************************$response******************************");
      if (response.statusCode == 200) {
        return  UserModel.fromJson(response.data);
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
     required String isDoctor,
  }) async {
    try {
      print("***************************************************$isDoctor");
      final response = await DioHelper.postData(
        url: "/users/",
        data: {
  "email": email,
  "password":password,
  "role": isDoctor,
  "username": name,
        },
      );
      print("***************$response*******************");
      if (response.statusCode == 201) {
        return true;
      }else{
         throw DataErrorException();
      }
     
    } catch (err) {

      print("*****************$err********************");
        throw DataErrorException();
    }
  }
}
