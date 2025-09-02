// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';

import '../../../ PatientDetails/domain/entities/Appointment.dart';

abstract class RemoteDataSourceAppointmentInPatient {
  Future<bool> bookingAppointment({
     required int doctorId,
   
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
     required int doctorId,
    required String name,
    String? email,
    required String phone,
    required String date,
    required String time,
  }) async {
       try {
      final response = await DioHelper.postData(
        url: "/appointments/",
       
        data:{
  "appointment_date": convertDateFormat(date),
  "appointment_time": time,
  "doctor": doctorId,
  "name":name,
  "phoneNumber":phone,
} ,
      );
      print("***************$response*******************");
      if (response.statusCode == 201) {
        print("oooookkkkkkyyyyyy");
        return true;
      } else {
        throw DataErrorException();
      }
    } catch (err) {
      print("*****************$err********************");
      throw DataErrorException();
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
