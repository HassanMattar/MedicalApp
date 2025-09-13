
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorFavoriteEntity%20.dart';
import '../repositories/DoctorInPatientRepository.dart';

class GetAllFavoriteDoctorUseCase {
  DoctorInPatientRepository repository;
  GetAllFavoriteDoctorUseCase({required this.repository});
  Future<Either<Failure, List<DoctorFavoriteEntity>>> call(){
    return repository.getAllFavoriteDoctor();
  }
}