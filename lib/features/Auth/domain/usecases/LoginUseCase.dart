// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/features/Auth/domain/repositories/Repository.dart';

import '../../../../Core/Error/Failure.dart';
import '../entities/Users.dart';

class LoginUseCase {
  AuthRepository repository;
  LoginUseCase({required this.repository});

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return await repository.logIn(email: email, password: password);
  }
}
