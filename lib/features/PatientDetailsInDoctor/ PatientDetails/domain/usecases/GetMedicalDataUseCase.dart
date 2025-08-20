// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../repositories/PatientDetailsForDoctorRepository.dart';


class GetMedicalDataUseCase {
  PatientDetailsForDoctorRepository repository;
  GetMedicalDataUseCase({required this.repository});
  Future<Either<Failure, bool>> call({required patient_Id}) {
   return repository.GetMedicalData(patient_Id: patient_Id);
  }
}
