// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/PatientProfileModel.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/data/models/DoctorProfileModel.dart';


abstract class DoctorDetailRemoteDataSource {
  Future<DoctorProfileModel> getDoctorMyInfo();

  Future<bool> updateDoctorInfo(
    { required  DoctorProfileModel doctor}
  );

  Future<List<PatientProfileModel>> getMyPatients();
}

class DoctorDetailRemoteDataSourceImpl extends DoctorDetailRemoteDataSource {
 
  @override
  Future<DoctorProfileModel> getDoctorMyInfo() async {
    try {

      try {
      final response = await DioHelper.getData(url: "/doctors/profile/");
      DoctorProfileModel doctor = DoctorProfileModel.fromJson(
        response.data,
      );
      print("doctor __________________________________________$doctor");
      return doctor;
    } catch (err) {
      print("**********************$err");
      throw ServerException();
    }
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<bool> updateDoctorInfo(
    {
    required  DoctorProfileModel doctor
    } 
  ) async {
    try {
       print(doctor.toJson());
      final response = await DioHelper.patchData(
        url: "/doctors/profile/",
       
        data: doctor.toJson(),
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
      Future<List<PatientProfileModel>> getMyPatients() async {
       
     try {
      final response = await DioHelper.getData(url: "/doctors/my-patients/");
     
      if (response.statusCode == 200) {
        final List data = response.data as List;
        final doctors = data
            .map((item) => PatientProfileModel.fromJson(item))
            .toList();
        print(doctors);
        return (doctors);
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (err) {
      throw ServerException;
    }
      }
  }
 