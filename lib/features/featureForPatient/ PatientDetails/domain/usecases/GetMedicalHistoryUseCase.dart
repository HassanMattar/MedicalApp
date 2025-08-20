// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';

import '../entities/Appointment.dart';
import '../repositories/PatientDetailsRepository.dart';

class GetMedicalHistoryUseCase {
  PatientDetailsRepository repository;
  GetMedicalHistoryUseCase({required this.repository});
  Future<Either<Failure, List<Appointment>>> call() {
    return repository.GetMedicalHistory();
  }
}
