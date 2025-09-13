// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/BookingAppointmentEntity%20.dart';

import '../repositories/PatientDetailsRepository.dart';

class GetMedicalHistoryUseCase {
  PatientDetailsRepository repository;
  GetMedicalHistoryUseCase({required this.repository});
  Future<Either<Failure, List<BookingAppointmentEntity>>> call() {
    return repository.GetMedicalHistory();
  }
}
