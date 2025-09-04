import 'package:dio/dio.dart';
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/FileModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/MedicalDataModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/PatientProfileModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/FileEntity.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/MedicalData.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import '../../domain/entities/Appointment.dart';

abstract class PatientDetailsRemoteDataSource {
  Future<List<Appointment>> GetMedicalHistory();
  Future<bool> UpdatePersonalInformation({
    required PatientProfileModel patient,
    required int id,
  });
  Future<bool> AddFiles({required List<dynamic> selectedFiles});
  Future<List<FileEntity>> GetFiles();
  Future<bool> UpdateMedicalData({
    required MedicalDataModel medicalData,
    required int id,
  });

  Future<PatientProfileEntity> getPersonalInfo({required int id});

  Future<MedicalData> getMedicalData({required int id});
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
  Future<bool> AddFiles({required List selectedFiles}) async {
    if (!selectedFiles.isEmpty) {
      try {
        List<MultipartFile> files = [];
        for (var file in selectedFiles) {
          files.add(
            await MultipartFile.fromFile(file.path!, filename: file.name),
          );
        }

        // Build FormData
        final formData = FormData.fromMap({
          "file": files, // backend key
        });

        final response = await DioHelper.postFile(
          url: "/attachments/",
          data: formData,
        );

        if (response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      } catch (err) {
        print("**********************$err");
        throw Exception("Server error");
      }
    } else {
      return true;
    }
  }
    @override
  Future<MedicalData> getMedicalData({required int id}) async {
    try {
      final response = await DioHelper.getData(
        url: "/patients/10/medical-data/",
      );
      print(response.data);

       MedicalDataModel result = MedicalDataModel.fromJson(response.data);
      return (result);
    } on DioException catch (dioErr) {
    print("Dio Error: ${dioErr.response?.statusCode} - ${dioErr.message}");
    throw ServerException();
  } catch (err) {
      print("****************************$err");

      throw ServerException();
    }
  }

 
  @override
  Future<bool> UpdateMedicalData({
    required MedicalDataModel medicalData,
    required int id,
  }) async {
    try {
      final response = await DioHelper.patchData(
        url: "/patients/$id/medical-data/",
        query: {"id": id},
        data: medicalData.toJson(),
      );
      print("________$response ------------------------------");
      if (response.statusCode == 200) {
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
      print("________$response ------------------------------");
      if (response.statusCode == 200) {
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

  

  @override
  Future<List<FileEntity>> GetFiles() async {
    try {
      final response = await DioHelper.getData(url: "/attachments/");

      if (response.statusCode == 200) {
        final result = response.data["results"];

        return FileModel.fromJsonList(result);
      } else {
        return [];
      }
    } catch (err) {
      print("**********************$err");
      throw Exception("Server error");
    }
  }
}
