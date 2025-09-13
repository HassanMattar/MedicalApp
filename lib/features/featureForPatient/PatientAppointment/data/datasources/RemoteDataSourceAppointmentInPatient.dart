// ignore_for_file: public_member_ap_constructors_first
import 'package:dio/dio.dart';
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/BookingAppointmentModel.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/data/models/AppointmentModel%20.dart';

abstract class RemoteDataSourceAppointmentInPatient {
  Future<bool> bookingAppointment({
    required BookingAppointmentModel appointment,
  });
 Future< List<AppointmentModel>> getPreviousAppointments();
  Future<List<AppointmentModel>> getUpComingAppointments();
}

class RemoteDataSourceAppointmentInPatientImpl
    extends RemoteDataSourceAppointmentInPatient {
  @override
  Future<bool> bookingAppointment({
    required BookingAppointmentModel appointment,
  }) async {
    print(appointment.toJson());
    appointment.appointmentDate = convertDateFormat(
      appointment.appointmentDate,
    );
    appointment.appointmentTime = convertArabicTimeTo24(appointment.appointmentTime);
    try {
      final response = await DioHelper.postData(
        url: "/appointments/",

        data: appointment.toJson(),
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
  Future<List<AppointmentModel>> getPreviousAppointments() async {
  
    try {
      final response = await DioHelper.getData(url: "/appointments/past/");
      print("*************$response");
      if (response.statusCode == 200) {
        return (AppointmentModel.listFromJson(response.data));
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (err) {
      throw ServerException;
    }
  }

  @override
  Future<List<AppointmentModel>> getUpComingAppointments() async {
    try {
      final response = await DioHelper.getData(url: "/appointments/");
      print("*************$response");
      if (response.statusCode == 200) {
        return (AppointmentModel.listFromJson(response.data));
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (err) {
      throw ServerException;
    }
  }
}
