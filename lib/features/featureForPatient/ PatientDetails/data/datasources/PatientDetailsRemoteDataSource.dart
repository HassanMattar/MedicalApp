import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/Auth/data/models/Patient%20.dart';
import '../../domain/entities/Appointment.dart';

abstract class PatientDetailsRemoteDataSource {
  Future<List<Appointment>> GetMedicalHistory();
  Future<bool> UpdatePersonalInformation({
    required String email,
    required String address,
    required String gender,
    required String name,
    required String barth,
    required String tel,
  });
  Future<bool> UpdateMedicalData({
    required List<dynamic> selectedFiles,
    required String description,
    required String diabetesType,
  });

  Future<Patient> getPersonalInfo();

  Future<void> getMedicalData();
}

class PatientDetailsRemoteDataSourceImpl
    extends PatientDetailsRemoteDataSource {
  @override
  Future<List<Appointment>> GetMedicalHistory() {
    try {
      List<Appointment> medicalHistoryData = [
        Appointment(
          doctorName: 'عبدالله العصــار',
          specialty: 'دكتور متخصص في أمراض السكر',
          status: 'مقبول',
          date: DateTime(2025, 6, 1),
          time: '8:15 PM',
          details: 'تفاصيل الحجز',
        ),
        Appointment(
          doctorName: 'عبدالله العصــار',
          specialty: 'دكتور متخصص في أمراض السكر',
          status: 'قيد الانتظار',
          date: DateTime(2025, 6, 5),
          time: '8:15 PM',
          details: 'تفاصيل الحجز',
        ),
      ];
      return Future.value(medicalHistoryData);
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<bool> UpdatePersonalInformation({
    required String email,
    required String address,
    required String gender,
    required String name,
    required String barth,
    required String tel,
  }) {
    try {
      print(email);
      print(gender);
      print(name);
      print(tel);
      print(barth);
      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<bool> UpdateMedicalData({
    required List selectedFiles,
    required String description,
    required String diabetesType,
  }) {
    try {
      print(selectedFiles);
      print(description);
      print(diabetesType);

      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }

  @override
  Future<Patient> getPersonalInfo() async {
    try {
      Patient patient = Patient(
        password: 'ddd',
        address: 'gaza',
        email: ' ffddd',
        name: 'حسن',
        phoneNumber: "0567607921",
        dateOfBirth: DateTime.now().toString(),
        gender: "ذكر",
      );
      return (patient);
    } catch (err) {
      print(err);

      throw ServerException();
    }
  }

  @override
  Future<void> getMedicalData() {
    try {
      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }
}
