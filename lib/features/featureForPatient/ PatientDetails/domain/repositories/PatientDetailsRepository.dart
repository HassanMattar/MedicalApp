import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/MedicalDataModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/FileEntity.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/MedicalData.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/BookingAppointmentEntity%20.dart';

abstract class PatientDetailsRepository {
  Future<Either<Failure, List<BookingAppointmentEntity>>> GetMedicalHistory();
  Future<Either<Failure, bool>> UpdatePersonalInformation({
    required PatientProfileEntity patient,

  });

  Future<Either<Failure, bool>> UpdateMedicalData({
   required MedicalDataModel medicalData,
  });
 Future<Either<Failure, bool>> AddFiles({
    required List<dynamic> selectedFiles,
  });
   Future<Either<Failure,  List<FileEntity>>> GetFiles();
  Future<Either<Failure, PatientProfileEntity>> getPersonalInfo();

  Future<Either<Failure, MedicalData>> getMedicalData();
}
