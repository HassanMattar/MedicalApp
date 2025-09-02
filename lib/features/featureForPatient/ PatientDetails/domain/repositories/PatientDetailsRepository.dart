import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import '../entities/Appointment.dart';

abstract class PatientDetailsRepository {
  Future<Either<Failure, List<Appointment>>> GetMedicalHistory();
  Future<Either<Failure, bool>> UpdatePersonalInformation({
    required PatientProfileEntity patient,

  });

  Future<Either<Failure, bool>> UpdateMedicalData({
    required List<dynamic> selectedFiles,
    required String description,
    required String diabetesType,
  });

  Future<Either<Failure, PatientProfileEntity>> getPersonalInfo();

  Future<Either<Failure, bool>> getMedicalData();
}
