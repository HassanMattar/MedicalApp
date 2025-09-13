import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';

abstract class PatientDetailsForDoctorRepository {


  Future<Either<Failure, bool>> GetMedicalData({required patient_Id});

  Future<Either<Failure, PatientProfileEntity>> getPersonalInfo();
}
