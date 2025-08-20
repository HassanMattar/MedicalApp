
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../../../../Auth/domain/entities/DoctorEntity.dart';
import '../repositories/DoctorInPatientRepository.dart';

class GetAllFavoriteDoctorUseCase {
  DoctorInPatientRepository repository;
  GetAllFavoriteDoctorUseCase({required this.repository});
  Future<Either<Failure, List<Doctor>>> call(){
    return repository.getAllFavoriteDoctor();
  }
}