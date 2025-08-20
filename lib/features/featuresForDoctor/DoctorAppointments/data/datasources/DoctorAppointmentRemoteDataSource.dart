import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';

abstract class DoctorAppointmentRemoteDataSource {
  
    Future<List<AppointmentRequired>> getDoctorBookingAppointment({
    required int pageDate,
  });
  
  Future<List<AppointmentRequired>> getDoctorWaitingAppointment({
    required int pageDate,
  });
  Future<bool> addNewAppointment({
    required String name,
    required String phone,
    String? email,
    required String date,
    required String time,
  });
  
}
class DoctorAppointmentRemoteDataSourceImpl
    extends DoctorAppointmentRemoteDataSource {

  Future<List<AppointmentRequired>> getDoctorWaitingAppointment({
    required int pageDate,
  })  async{
    try {
      print(pageDate);
      return await appointmentRequired;
    } catch (err) {
      throw ServerException();
    }
  }
  
  @override
  Future<bool> addNewAppointment({
    required String name,
     required String phone,
      String? email, 
      required String date,
       required String time}
       )async {
      try {
      return await true;
    } catch (err) {
      throw ServerException();
    }
  }
  
  @override
  Future<List<AppointmentRequired>> getDoctorBookingAppointment({required int pageDate}) async {
     try {
      print(pageDate);
      return await appointmentRequired;
    } catch (err) {
      throw ServerException();
    }
  }
  

}
