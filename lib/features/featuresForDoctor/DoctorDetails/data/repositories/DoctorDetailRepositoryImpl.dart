import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart' show NetworkInfo;
import 'package:medical2/Core/TokenService/TokenService.dart' show TokenService;

import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/PatientProfileModel.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/data/models/DoctorProfileModel.dart';
import '../../domain/repositories/DoctorDetailRepository.dart';
import '../datasources/DoctorDetailRemoteDataSource.dart';

class DoctorDetailRepositoryImpl extends DoctorDetailRepository {
  final DoctorDetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  DoctorDetailRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });
  @override
  Future<Either<Failure, DoctorProfileModel>> getDoctorMyInfo() async {
   bool isConnected =await networkInfo.isConnected;
  if(!isConnected) {return left(NetworkFailure());}else{
     try {
       DoctorProfileModel doctor= await remoteDataSource.getDoctorMyInfo();
      return right(doctor);
    } on ServerException {
      return (left(ServerFailure()));
    }
  }
   
  }
  
  @override
Future<Either<Failure,bool >> updateDoctorInfo({
    required DoctorProfileModel doctor
  }) async {
      bool isConnected =await networkInfo.isConnected;
  if(!isConnected) {return left(NetworkFailure());}else{
     try {
      bool result = await remoteDataSource.updateDoctorInfo(
        doctor: doctor
      );
      return right(result);
    } on ServerException {
      return (left(ServerFailure()));
    }
  }
  }

  @override
  Future<Either<Failure,List<PatientProfileModel>>> getMyPatients()async {
        bool isConnected =await networkInfo.isConnected;
  if(!isConnected) {return left(NetworkFailure());}else{
     try {
    List<PatientProfileModel> result = await remoteDataSource.getMyPatients();
      return right(result);
    } on ServerException {
      return (left(ServerFailure()));
    }
  }
  }
}
