import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart' show NetworkInfo;
import 'package:medical2/Core/TokenService/TokenService.dart' show TokenService;

import 'package:medical2/features/Auth/domain/entities/DoctorEntity.dart';
import 'package:medical2/features/Auth/domain/entities/patientEntity.dart';
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
  Future<Either<Failure, Doctor>> getDoctorMyInfo() async {
   bool isConnected =await networkInfo.isConnected;
  if(!isConnected) {return left(NetworkFailure());}else{
     try {
      var doctor = await remoteDataSource.getDoctorMyInfo();
      return right(doctor);
    } on ServerException {
      return (left(ServerFailure()));
    }
  }
   
  }
  
  @override
Future<Either<Failure,bool >> updateDoctorInfo({
    required String name,
    required String address,
    required String phone,
    required String fromTime,
    required String toTime,
    required String qualifications,
  }) async {
      bool isConnected =await networkInfo.isConnected;
  if(!isConnected) {return left(NetworkFailure());}else{
     try {
      bool result = await remoteDataSource.updateDoctorInfo();
      return right(result);
    } on ServerException {
      return (left(ServerFailure()));
    }
  }
  }

  @override
  Future<Either<Failure,List<Patient>>> getMyPatients()async {
        bool isConnected =await networkInfo.isConnected;
  if(!isConnected) {return left(NetworkFailure());}else{
     try {
    List<Patient> result = await remoteDataSource.getMyPatients();
      return right(result);
    } on ServerException {
      return (left(ServerFailure()));
    }
  }
  }
}
