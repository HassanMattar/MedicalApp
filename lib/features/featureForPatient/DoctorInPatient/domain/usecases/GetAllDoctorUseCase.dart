// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorListEntity.dart';

import '../repositories/DoctorInPatientRepository.dart';

class GetAllDoctorUseCase {
  DoctorInPatientRepository repository;
  GetAllDoctorUseCase({required this.repository});
  Future<Either<Failure, List<DoctorListEntity>>> call(){
    return repository.getAllDoctor();
  }
}
