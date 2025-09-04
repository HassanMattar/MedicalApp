
import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/MedicalData.dart';

import '../repositories/PatientDetailsRepository.dart';
class GetMedicalDataUseCase {
  PatientDetailsRepository repository;
  GetMedicalDataUseCase({required this.repository});
  Future<Either<Failure, MedicalData>> call() {
    return repository.getMedicalData();
  }
}