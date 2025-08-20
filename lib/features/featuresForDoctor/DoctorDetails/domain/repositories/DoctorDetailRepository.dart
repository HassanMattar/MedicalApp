import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/Auth/domain/entities/DoctorEntity.dart';
import 'package:medical2/features/Auth/domain/entities/patientEntity.dart';

abstract class DoctorDetailRepository {
  Future<Either<Failure, Doctor>> getDoctorMyInfo();

  Future<Either<Failure, bool>> updateDoctorInfo({
    required String name,
    required String address,
    required String phone,
    required String fromTime,
    required String toTime,
    required String qualifications,
  });

  Future<Either<Failure,List<Patient>>>  getMyPatients();
}
