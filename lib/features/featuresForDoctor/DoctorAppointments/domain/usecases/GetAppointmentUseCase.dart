import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featuresForDoctor/DoctorAppointments/domain/repositories/DoctorAppointmentRepository.dart';

class GetWaitingAppointmentUseCase {
  DoctorAppointmentRepository repository;
  GetWaitingAppointmentUseCase({required this.repository});
  Future<Either<Failure, List<AppointmentRequired>>> call({required int pageDate}) {
    return repository.getAppointment(pageDate: pageDate);
  }
}
