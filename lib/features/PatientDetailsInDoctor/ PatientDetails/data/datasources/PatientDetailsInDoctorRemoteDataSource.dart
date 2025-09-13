import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';

abstract class PatientDetailsInDoctorRemoteDataSource {
  Future<PatientProfileEntity> getPersonalInfo();

  Future<bool> getMedicalData();
}

class PatientDetailsInDoctorRemoteDataSourceImpl
    extends PatientDetailsInDoctorRemoteDataSource {
  @override
  Future<PatientProfileEntity> getPersonalInfo() {
    try {
   throw ServerException();
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<bool> getMedicalData() {
    try {
      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }
}
