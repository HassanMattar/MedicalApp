import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/BookingAppointmentModel.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/data/models/AppointmentModel%20.dart';

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
   required  BookingAppointmentModel appointment,

  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
        bool result = await remoteDataSource.bookingAppointment(
          appointment: appointment
        );

        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure,  List<AppointmentModel>>> getPreviousAppointments() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
         List<AppointmentModel>  result = await remoteDataSource.getPreviousAppointments();

        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getUpComingAppointments()async {
      if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
        List<AppointmentModel>  result = await remoteDataSource.getUpComingAppointments();

        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
