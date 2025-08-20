import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/Appointment.dart';

import '../../domain/repositories/AppointmentRepository.dart';
import '../datasources/RemoteDataSourceAppointmentInPatient.dart';

class AppointmentRepositoryImpl extends AppointmentRepository {
  final RemoteDataSourceAppointmentInPatient remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  AppointmentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });
  @override
  Future<Either<Failure, bool>> bookingAppointment({
    required String name,
    String? email,
    required String phone,
    required String date,
    required String time,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
        bool result = await remoteDataSource.bookingAppointment(
          name: name,
          phone: phone,
          date: date,
          time: time,
        );

        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Appointment>>> getPreviousAppointments() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
        List<Appointment>  result = await remoteDataSource.getPreviousAppointments();

        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Appointment>>> getUpComingAppointments()async {
      if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
        List<Appointment>  result = await remoteDataSource.getUpComingAppointments();

        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
