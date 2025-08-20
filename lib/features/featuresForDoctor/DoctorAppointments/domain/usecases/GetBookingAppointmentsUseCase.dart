// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featuresForDoctor/DoctorAppointments/domain/repositories/DoctorAppointmentRepository.dart';

class GetBookingAppointmentsUseCase {
  DoctorAppointmentRepository repository;
  GetBookingAppointmentsUseCase({
    required this.repository,
  });
  Future<Either<Failure,List<AppointmentRequired>>> call({required int pageDate}) {
    return repository.getBookingAppointments(pageDate:pageDate );
  }
}
