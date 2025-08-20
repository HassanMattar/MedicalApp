import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/Auth/data/models/Patient%20.dart';
import '../entities/Appointment.dart';

abstract class PatientDetailsRepository {
  Future<Either<Failure, List<Appointment>>> GetMedicalHistory();
  Future<Either<Failure, bool>> UpdatePersonalInformation({
    required String email,
    required String address,
    required String gender,
    required String name,
    required String barth,
    required String tel,
  });

  Future<Either<Failure, bool>> UpdateMedicalData({
    required List<dynamic> selectedFiles,
    required String description,
    required String diabetesType,
  });

  Future<Either<Failure, Patient>> getPersonalInfo();

  Future<Either<Failure, bool>> getMedicalData();
}
