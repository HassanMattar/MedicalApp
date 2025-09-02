// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/Auth/domain/entities/DoctorEntity.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

import '../repositories/DoctorInPatientRepository.dart';

class GetAllDoctorUseCase {
  DoctorInPatientRepository repository;
  GetAllDoctorUseCase({required this.repository});
  Future<Either<Failure, List<DoctorEntity>>> call(){
    return repository.getAllDoctor();
  }
}
