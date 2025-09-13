import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorFavoriteModel.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorListModel%20.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

abstract class DoctorInPatientRepository {
  Future<Either<Failure, List<DoctorListModel>>> getAllDoctor();
  Future<Either<Failure, List<DoctorFavoriteModel>>> getAllFavoriteDoctor();
  Future<Either<Failure, bool>> AddFavoriteForDoctor({required int doctorId});
  Future<Either<Failure, bool>> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  });

  Future<Either<Failure, bool>> removeFavoriteForDoctor({
    required int doctorId,
  });
}
