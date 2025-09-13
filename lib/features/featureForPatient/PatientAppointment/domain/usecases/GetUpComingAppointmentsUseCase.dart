

import 'package:dartz/dartz.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/AppointmentEntity%20.dart';

import '../../../../../Core/Error/Failure.dart';
import '../repositories/AppointmentRepository.dart';

class GetUpComingAppointmentsUseCase {
  AppointmentRepository repository;
  GetUpComingAppointmentsUseCase({
    required this.repository,
  });
  Future<Either<Failure, List< AppointmentEntity>>> call() {
    return repository.getUpComingAppointments();
  }

}