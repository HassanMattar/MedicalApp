import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/Auth/data/models/Patient%20.dart';

abstract class PatientDetailsInDoctorRemoteDataSource {
  Future<Patient> getPersonalInfo();

  Future<bool> getMedicalData();
}

class PatientDetailsInDoctorRemoteDataSourceImpl
    extends PatientDetailsInDoctorRemoteDataSource {
  @override
  Future<Patient> getPersonalInfo() {
    try {
      Patient medicalHistoryData = Patient(
        password: 'ddd',
        address: 'gaza',
        email: ' ffddd',
        name: 'حسن',
        phoneNumber: "0567607921",
        dateOfBirth: DateTime.now().toString(),
        gender: "ذكر",
      );
      return Future.value(medicalHistoryData);
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
