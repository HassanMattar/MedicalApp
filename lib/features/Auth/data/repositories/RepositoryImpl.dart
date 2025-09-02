// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';
import 'package:medical2/features/Auth/data/datasources/RemoteDataSource.dart';
import 'package:medical2/features/Auth/domain/repositories/Repository.dart';

import '../../../../Core/Network/NetworkInfo.dart';
import '../../domain/entities/Users.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });

  @override
  Future<Either<Failure, bool>> changePassword({
    required String email,
    required String password,
  }) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> logIn({
    required String email,
    required String password,
     required bool isDoctor,
  }) async {
    // if (!await networkInfo.isConnected) {
    //   return Left(NetworkFailure());
    // } else
    {
      try {
        UserEntity result = await remoteDataSource.login(
          email: email,
          password: password,
        );
        tokenService.saveTokenAndUserType(
          profile_id:result.patientProfileId,
        token: result.token,
        isDoctor: false 
        );
       
        return right(result);
      } on InvalidEmailOrPasswordException {
        return Left(InvalidEmailOrPasswordFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> signUP({
    required String name,
    required String email,
    required String password,
    required String userType,
  }) async {
    try {
      await remoteDataSource.signUp(
        email: email,
        name: name,
        password: password,
        isDoctor: userType
      );
      return right(true);
    } on InvalidEmailOrPasswordException {
      return Left(InvalidEmailOrPasswordFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on DataErrorException {
      return Left(DataErrorFailure());
    }
  }
}
