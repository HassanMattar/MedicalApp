
import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';

import '../repositories/PatientDetailsRepository.dart';
class GetMedicalDataUseCase {
  PatientDetailsRepository repository;
  GetMedicalDataUseCase({required this.repository});
  Future<Either<Failure, bool>> call() {
    return repository.getMedicalData();
  }
}