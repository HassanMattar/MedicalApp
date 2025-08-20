import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../../../../Auth/data/models/Patient .dart';
import '../repositories/PatientDetailsForDoctorRepository.dart';

class GetPersonalInfoUseCase {
  PatientDetailsForDoctorRepository repository;
  GetPersonalInfoUseCase({required this.repository});
  Future<Either<Failure, Patient>> call() {
    return repository.getPersonalInfo();
  }
}