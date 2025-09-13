import 'package:dartz/dartz.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/BookingAppointmentModel.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/data/models/AppointmentModel%20.dart';

import '../../../../../Core/Error/Failure.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, bool>> bookingAppointment({
          required  BookingAppointmentModel appointment
,});
   Future<Either<Failure,  List<AppointmentModel>>>  getPreviousAppointments();

  Future<Either<Failure, List<AppointmentModel>>> getUpComingAppointments();
}
