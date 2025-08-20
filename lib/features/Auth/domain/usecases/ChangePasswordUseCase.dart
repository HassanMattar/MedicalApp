import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/Auth/domain/repositories/Repository.dart';

class ChangePasswordUseCase {
  AuthRepository repository;
  ChangePasswordUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required String email,
    required String password,
  }) async {
    return await repository.changePassword(email: email, password: password);
  }
}
