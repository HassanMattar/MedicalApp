import 'package:dartz/dartz.dart';

import '../../../ PatientDetails/domain/entities/Appointment.dart';
import '../../../../../Core/Error/Failure.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, bool>> bookingAppointment({
          required int doctorId,
     required String name ,
  String? email ,
  required String date,required String time, required String phone,});
  Future<Either<Failure, List<Appointment>>> getPreviousAppointments();

  Future<Either<Failure, List<Appointment>>> getUpComingAppointments();
}
