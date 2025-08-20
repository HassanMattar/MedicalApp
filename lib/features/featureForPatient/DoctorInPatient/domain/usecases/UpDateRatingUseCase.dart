

import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../repositories/DoctorInPatientRepository.dart';

class UpdateRatingUseCase {
  DoctorInPatientRepository repository;
  UpdateRatingUseCase({required this.repository});
  Future<Either<Failure, bool>> call({required int doctorId,required double rating}){
    return repository.UpDateDoctorRating(doctorId:doctorId,rating:rating);
  }
}
