import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';

import '../repositories/PatientDetailsRepository.dart';

class GetPersonalInfoUseCase {
  PatientDetailsRepository repository;
  GetPersonalInfoUseCase({required this.repository});
  Future<Either<Failure, PatientProfileEntity>> call() {
    return repository.getPersonalInfo();
  }
}