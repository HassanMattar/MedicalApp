// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/Auth/domain/entities/patientEntity.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/repositories/DoctorDetailRepository.dart';

class GetMyPatientUseCase {
  DoctorDetailRepository repository;
  GetMyPatientUseCase({required this.repository});
  Future<Either<Failure,List<Patient>>>  call() {
    return repository.getMyPatients();
  }
}
