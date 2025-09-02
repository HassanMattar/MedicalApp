import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/repositories/PatientDetailsRepository.dart';

class UpdatePersonalInformationUseCase {
  PatientDetailsRepository repository;
  UpdatePersonalInformationUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required PatientProfileEntity patient,
   
  }) {
    return repository.UpdatePersonalInformation(
   patient:patient
    );
  }
}
