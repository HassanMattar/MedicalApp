// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import '../../../../../Core/TokenService/TokenService.dart';
import '../../domain/repositories/PatientDetailsForDoctorRepository.dart';
import '../datasources/PatientDetailsInDoctorRemoteDataSource.dart';

class PatientDetailsInDoctorRepositoryImpl extends PatientDetailsForDoctorRepository {
  final PatientDetailsInDoctorRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  PatientDetailsInDoctorRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });

  
  @override
  Future<Either<Failure, PatientProfileEntity>> getPersonalInfo() async {
     if (await networkInfo.isConnected) {
      try {
        PatientProfileEntity patientInfo =
            await remoteDataSource.getPersonalInfo();
        return Right(patientInfo);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> GetMedicalData({required patient_Id}) async {
      if (await networkInfo.isConnected) {
      try {
        bool result =
            await remoteDataSource.getMedicalData();
        return Right(result);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }
}
