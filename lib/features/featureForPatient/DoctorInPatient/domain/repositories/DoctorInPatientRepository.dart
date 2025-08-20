import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../../../../Auth/domain/entities/DoctorEntity.dart';

abstract class DoctorInPatientRepository {
  Future<Either<Failure, List<Doctor>>> getAllDoctor();
    Future<Either<Failure, List<Doctor>>> getAllFavoriteDoctor();
  Future<Either<Failure, bool>> AddFavoriteForDoctor({required int doctorId});
    Future<Either<Failure, bool>> UpDateDoctorRating({required int doctorId,required double rating});
  
}
