// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';

import '../../../ PatientDetails/domain/entities/Appointment.dart';

abstract class RemoteDataSourceAppointmentInPatient {
  Future<bool> bookingAppointment({
    required String name,
    String? email,
    required String phone,
    required String date,
    required String time,
  });
  List<Appointment> getPreviousAppointments();
  List<Appointment> getUpComingAppointments();
}

class RemoteDataSourceAppointmentInPatientImpl
    extends RemoteDataSourceAppointmentInPatient {
  @override
  Future<bool> bookingAppointment({
    required String name,
    String? email,
    required String phone,
    required String date,
    required String time,
  }) {
    try {
      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  List<Appointment> getPreviousAppointments() {
    try {
      return previousAppointments;
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  List<Appointment> getUpComingAppointments() {
    try {
      return [];
    } catch (err) {
      throw ServerException();
    }
  }
}
