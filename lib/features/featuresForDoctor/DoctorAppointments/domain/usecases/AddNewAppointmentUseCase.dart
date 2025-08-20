// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featuresForDoctor/DoctorAppointments/domain/repositories/DoctorAppointmentRepository.dart'
    show DoctorAppointmentRepository;

class AddNewAppointmentUseCase {
  DoctorAppointmentRepository repository;
  AddNewAppointmentUseCase({required this.repository});

 Future<Either<Failure, bool>> call({ required String name ,
 required String phone,
  String? email ,
  required String date,required String time}) {
    return repository.addNewAppointment(date: date, name: name, time:time,email: email, phone:phone);
  }
}
