// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/MedicalDataModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/MedicalData.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/repositories/PatientDetailsRepository.dart';

class UpdateMedicalDataUseCase {
  PatientDetailsRepository repository;
  UpdateMedicalDataUseCase({required this.repository});
  Future<Either<Failure, bool>> call({required MedicalData medicalDataa}) {
    MedicalDataModel medicalData = MedicalDataModel(
      diabetesType: medicalDataa.diabetesType,
      medical_notes: medicalDataa.medical_notes,
    );
    return repository.UpdateMedicalData(medicalData: medicalData);
  }
}
