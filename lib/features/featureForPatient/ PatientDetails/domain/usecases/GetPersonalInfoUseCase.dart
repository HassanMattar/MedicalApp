import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../../../../Auth/data/models/Patient .dart';
import '../repositories/PatientDetailsRepository.dart';

class GetPersonalInfoUseCase {
  PatientDetailsRepository repository;
  GetPersonalInfoUseCase({required this.repository});
  Future<Either<Failure, Patient>> call() {
    return repository.getPersonalInfo();
  }
}