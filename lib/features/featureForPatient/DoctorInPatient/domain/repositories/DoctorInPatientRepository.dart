import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

import '../../../../Auth/domain/entities/DoctorEntity.dart';

abstract class DoctorInPatientRepository {
  Future<Either<Failure, List<DoctorEntity>>> getAllDoctor();
    Future<Either<Failure, List<DoctorEntity>>> getAllFavoriteDoctor();
  Future<Either<Failure, bool>> AddFavoriteForDoctor({required int doctorId});
    Future<Either<Failure, bool>> UpDateDoctorRating({required int doctorId,required double rating});
  
}
