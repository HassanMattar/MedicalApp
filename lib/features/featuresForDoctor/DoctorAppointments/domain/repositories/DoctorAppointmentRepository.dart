import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/constant.dart';
abstract class DoctorAppointmentRepository {
  Future<Either<Failure,List<AppointmentRequired>>> getAppointment({
    required int pageDate,
  });
   Future<Either<Failure,List<AppointmentRequired>>>getBookingAppointments({
    required int pageDate,
  });

    Future<Either<Failure,bool>> addNewAppointment({ required String name ,
 required String phone,
  String? email ,
  required String date,required String time});
}
