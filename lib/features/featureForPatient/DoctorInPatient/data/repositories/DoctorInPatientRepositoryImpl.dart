// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';

import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorFavoriteModel.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorListModel%20.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

import '../../domain/repositories/DoctorInPatientRepository.dart';
import '../datasources/DoctorInPatientRemoteDataSource.dart';

class DoctorInPatientRepositoryImpl extends DoctorInPatientRepository {
  final DoctorInPatientRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  DoctorInPatientRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });
  @override
  Future<Either<Failure, List<DoctorListModel>>> getAllDoctor() async {
    if (await networkInfo.isConnected) {
      try {
        List<DoctorListModel> doctors = await remoteDataSource.getAllDoctor();
        return Right(doctors);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> AddFavoriteForDoctor({
    required int doctorId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        bool isAdded = await remoteDataSource.AddFavoriteForDoctor(
          doctorId: doctorId,
        );
        return Right(isAdded);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        bool isRatting = await remoteDataSource.UpDateDoctorRating(
          doctorId: doctorId,
          rating: rating,
        );
        return Right(isRatting);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<DoctorFavoriteModel>>> getAllFavoriteDoctor() async {
    if (await networkInfo.isConnected) {
      try {
        List<DoctorFavoriteModel> doctors = await remoteDataSource
            .getAllFavoriteDoctor();
              print("xxxxxxxxxxxxx$doctors");
        return Right(doctors);
      
      } on ServerException {
        return await Left(ServerFailure());
      } catch (err) {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> removeFavoriteForDoctor({required int doctorId}) async {
    if (await networkInfo.isConnected) {
      try {
        bool isRemoved = await remoteDataSource.removeFavoriteForDoctor(
          doctorId: doctorId,
        );
        return Right(isRemoved);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }
}
