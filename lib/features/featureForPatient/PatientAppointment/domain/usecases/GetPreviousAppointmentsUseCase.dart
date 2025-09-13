// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/AppointmentEntity%20.dart';

import '../../../../../Core/Error/Failure.dart';
import '../repositories/AppointmentRepository.dart';

class GetPreviousAppointmentsUseCase {
  AppointmentRepository repository;
  GetPreviousAppointmentsUseCase({
    required this.repository,
  });
  Future<Either<Failure,  List<AppointmentEntity>>> call() {
    return repository.getPreviousAppointments();
  }
}
