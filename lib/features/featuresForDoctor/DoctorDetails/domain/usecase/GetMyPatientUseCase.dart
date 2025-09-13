// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/repositories/DoctorDetailRepository.dart';

class GetMyPatientUseCase {
  DoctorDetailRepository repository;
  GetMyPatientUseCase({required this.repository});
  Future<Either<Failure,List<PatientProfileEntity>>>  call() {
    return repository.getMyPatients();
  }
}
