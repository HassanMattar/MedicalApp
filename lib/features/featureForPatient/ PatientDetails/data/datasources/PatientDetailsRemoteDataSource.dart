import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/PatientProfileModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import '../../domain/entities/Appointment.dart';

abstract class PatientDetailsRemoteDataSource {
  Future<List<Appointment>> GetMedicalHistory();
  Future<bool> UpdatePersonalInformation({
    required PatientProfileModel patient,
    required int id,
  });
  Future<bool> UpdateMedicalData({
    required List<dynamic> selectedFiles,
    required String description,
    required String diabetesType,
  });

  Future<PatientProfileEntity> getPersonalInfo({required int id});

  Future<void> getMedicalData({required int id});
}

class PatientDetailsRemoteDataSourceImpl
    extends PatientDetailsRemoteDataSource {
  @override
  Future<List<Appointment>> GetMedicalHistory() async {
    try {
      final response = await DioHelper.getData(url: "/users/");

      print("***************$response*******************");
      if (response.statusCode == 201) {
        return await [
          Appointment(
            doctorName: "doctorName",
            specialty: "specialty",
            status: "status",
            date: DateTime(2022),
            time: "time",
            details: "details",
          ),
          Appointment(
            doctorName: "doctorName",
            specialty: "specialty",
            status: "status",
            date: DateTime(2022),
            time: "time",
            details: "details",
          ),
          Appointment(
            doctorName: "doctorName",
            specialty: "specialty",
            status: "status",
            date: DateTime(2022),
            time: "time",
            details: "details",
          ),
        ];
      }
      throw DataErrorException();
    } catch (err) {
      print("*****************$err********************");
      throw DataErrorException();
    }
  }

  @override
  Future<bool> UpdateMedicalData({
    required List selectedFiles,
    required String description,
    required String diabetesType,
  }) {
    // TODO: implement UpdateMedicalData
    throw UnimplementedError();
  }

  @override
  Future<bool> UpdatePersonalInformation({
    required PatientProfileModel patient,
    required int id,
  }) async {
   
    try {
      print(patient.toJson());
      final response = await DioHelper.putData(
        url: "/patients/$id/",
        query: {"id": id},
        data: patient.toJson(),
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
  Future<void> getMedicalData({required int id}) async {
    try {
      final response = await DioHelper.getData(
        url: "/api/patients/$id/medical-data/",
        query: {"id": id},
      );

      PatientProfileEntity patient = PatientProfileModel.fromJson(
        response.data,
      );
      print("patient __________________________________________$patient");
    } catch (err) {
      print(err);
      throw ServerException();
    }
  }

  @override
  Future<PatientProfileEntity> getPersonalInfo({required int id}) async {
    try {
      final response = await DioHelper.getData(url: "/patients/$id/");
      PatientProfileEntity patient = PatientProfileModel.fromJson(
        response.data,
      );
      print("patient __________________________________________$patient");
      return patient;
    } catch (err) {
      print("**********************$err");
      throw ServerException();
    }
  }
}
