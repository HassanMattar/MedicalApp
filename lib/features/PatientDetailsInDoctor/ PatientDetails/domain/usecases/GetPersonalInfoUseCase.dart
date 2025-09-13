import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';

import '../repositories/PatientDetailsForDoctorRepository.dart';

class GetPersonalInfoForPatientInDoctorUseCase {
  PatientDetailsForDoctorRepository repository;
  GetPersonalInfoForPatientInDoctorUseCase({required this.repository});
  Future<Either<Failure, PatientProfileEntity>> call() {
    return repository.getPersonalInfo();
  }
}