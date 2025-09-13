import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/PatientProfileModel.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/data/models/DoctorProfileModel.dart';

abstract class DoctorDetailRepository {
  Future<Either<Failure, DoctorProfileModel>> getDoctorMyInfo();

  Future<Either<Failure, bool>> updateDoctorInfo({
  
    required DoctorProfileModel doctor
  
  });

  Future<Either<Failure,List<PatientProfileModel>>>  getMyPatients();
}
