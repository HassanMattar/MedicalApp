import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../entities/Users.dart';


abstract class AuthRepository {
  Future<Either<Failure, bool>> signUP({
    required String name,
    required String email,
    required String password,
    required String userType,
    
  });
  Future<Either<Failure, UserEntity>> logIn({
    required String email,
    required String password,
     required bool isDoctor,
  });
  Future<Either<Failure, bool>> changePassword({
    required String email,
    required String password,
  });
}
