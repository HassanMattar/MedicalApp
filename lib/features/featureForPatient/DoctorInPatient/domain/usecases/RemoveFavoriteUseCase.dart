

import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../repositories/DoctorInPatientRepository.dart';

class RemoveFavoriteUseCase {
  DoctorInPatientRepository repository;
  RemoveFavoriteUseCase({required this.repository});
  Future<Either<Failure, bool>> call({required int doctorId}){
    return repository.removeFavoriteForDoctor(doctorId:doctorId);
  }
}
