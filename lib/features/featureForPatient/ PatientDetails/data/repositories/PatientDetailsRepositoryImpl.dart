// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/BookingAppointmentModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/MedicalDataModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/PatientProfileModel.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/FileEntity.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/MedicalData.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
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
  Future<Either<Failure, List<BookingAppointmentModel>>> GetMedicalHistory() async {
    if (await networkInfo.isConnected) {
      try {
        List<BookingAppointmentModel> medicalHistoryData =
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
    required PatientProfileEntity patient,
  }) async {
    PatientProfileModel patientModel = PatientProfileModel(
      email: patient.email,
      fullName: patient.fullName,
      address: patient.address,
      dateOfBirth: patient.dateOfBirth,
      gender: patient.gender,
      phoneNumber: patient.phoneNumber,
    );
    // if (await networkInfo.isConnected) {
    try {
      final profileId = await tokenService.getProfileId();
      bool result = await remoteDataSource.UpdatePersonalInformation(
        id: int.parse(profileId!),
        patient: patientModel,
      );
      return Future.value(Right(result));
    } on ServerException {
      return await Future.value(Left(ServerFailure()));
    }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }

  @override
  Future<Either<Failure, bool>> UpdateMedicalData({
    required MedicalDataModel medicalData,
  }) async {
    // if (await networkInfo.isConnected) {
    try {
      String? id = await tokenService.getProfileId();
      await remoteDataSource.UpdateMedicalData(
        id: int.parse(id!),
      
      medicalData: medicalData
      );

      return Future.value(Right(true));
    } on ServerException {
      return await Future.value(Left(ServerFailure()));
    }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }

  @override
  Future<Either<Failure, PatientProfileEntity>> getPersonalInfo() async {
    //   if (await networkInfo.isConnected) {
    try {
      String? id = await tokenService.getProfileId();
      PatientProfileEntity patientInfo = await remoteDataSource.getPersonalInfo(
        id: int.parse(id!),
      );
      return Right(patientInfo);
    } on ServerException {
      return await Left(ServerFailure());
    }
    // } else {
    //   return await Left(NetworkFailure());
    // }
  }

  @override
  Future<Either<Failure, MedicalData>> getMedicalData() async {
    //  if (await networkInfo.isConnected) {
    try {
         String? id = await tokenService.getProfileId();
    MedicalData result=  await remoteDataSource.getMedicalData(
        id: int.parse(id!),
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }

  @override
  Future<Either<Failure, bool>> AddFiles({
    required List<dynamic> selectedFiles,
  }) async {
    //    if (await networkInfo.isConnected) {
    String? token = await tokenService.getToken();
    print("2222222$token");
    try {
      await remoteDataSource.AddFiles(selectedFiles: selectedFiles);

      return Future.value(Right(true));
    } on ServerException {
      return await Future.value(Left(ServerFailure()));
    }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }

@override
  Future<Either<Failure, List<FileEntity>>> GetFiles() async {
    //    if (await networkInfo.isConnected) {
    try {
     final result= await remoteDataSource.GetFiles();
      return Future.value(Right(result));
    } on ServerException {
      return await Future.value(Left(ServerFailure()));
    }
    // } else {
    //   return Left(NetworkFailure());
    // }
  }

}
