// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/Auth/domain/entities/patientEntity.dart';

import '../../../../Auth/domain/entities/DoctorEntity.dart';

abstract class DoctorDetailRemoteDataSource {
  Future<Doctor> getDoctorMyInfo();

  Future<bool> updateDoctorInfo();

  Future<List<Patient>> getMyPatients();
}

class DoctorDetailRemoteDataSourceImpl extends DoctorDetailRemoteDataSource {
 
  @override
  Future<Doctor> getDoctorMyInfo() async {
    try {
      return await allDoctors[0];
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<bool> updateDoctorInfo() {
    try {
      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }
  
  @override
  Future<List<Patient>> getMyPatients() async {
      try {
      return await patient;
    } catch (err) {
      throw ServerException();
    }
  }
}
