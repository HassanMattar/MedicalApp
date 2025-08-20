

import 'package:dartz/dartz.dart';

import '../../../ PatientDetails/domain/entities/Appointment.dart';
import '../../../../../Core/Error/Failure.dart';
import '../repositories/AppointmentRepository.dart';

class GetUpComingAppointmentsUseCase {
  AppointmentRepository repository;
  GetUpComingAppointmentsUseCase({
    required this.repository,
  });
  Future<Either<Failure, List< Appointment>>> call() {
    return repository.getPreviousAppointments();
  }

}