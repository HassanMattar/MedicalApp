// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';

import '../repositories/AppointmentRepository.dart';

class BookingAppointmentUseCase {
  AppointmentRepository repository;
  BookingAppointmentUseCase({required this.repository});
  Future<Either<Failure, bool>> call({ required String name ,
       required int doctorId,

 required String phone,
  String? email ,
  required String date,required String time}) {
    return repository.bookingAppointment(date: date, name: name, time:time,email: email, phone:phone, doctorId: doctorId,);
  }
}
