// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/features/Auth/data/models/Patient%20.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/Appointment.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/repositories/PatientDetailsRepository.dart';

import '../../../../../Core/TokenService/TokenService.dart';
import '../datasources/PatientDetailsRemoteDataSource.dart';

class PatientDetailsRepositoryImpl extends PatientDetailsRepository {
  final PatientDetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  PatientDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });

  @override
  Future<Either<Failure, List<Appointment>>> GetMedicalHistory() async {
    if (await networkInfo.isConnected) {
      try {
        List<Appointment> medicalHistoryData =
            await remoteDataSource.GetMedicalHistory();
        return Right(medicalHistoryData);
      } on ServerException {
        return await Left(ServerFailure());
      }
    } else {
      return await Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> UpdatePersonalInformation({
    required String email,
    required String address,
    required String gender,
    required String name,
    required String barth,
    required String tel,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        bool result = await remoteDataSource.UpdatePersonalInformation(
          email: email,
          address: address,
          gender: gender,
          name: name,
          barth: barth,
          tel: tel,
        );
        return Future.value(Right(result));
      } on ServerException {
        return await Future.value(Left(ServerFailure()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> UpdateMedicalData({
    required List<dynamic> selectedFiles,
    required String description,
    required String diabetesType,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.UpdateMedicalData(
          selectedFiles: selectedFiles,
          description: description,
          diabetesType: diabetesType,
        );

        return Future.value(Right(true));
      } on ServerException {
        return await Future.value(Left(ServerFailure()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Patient>> getPersonalInfo() async {
     if (await networkInfo.isConnected) {
      try {
        Patient patientInfo =
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
  Future<Either<Failure, bool>> getMedicalData() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getMedicalData(
        
        );

        return Future.value(Right(true));
      } on ServerException {
        return await Future.value(Left(ServerFailure()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
