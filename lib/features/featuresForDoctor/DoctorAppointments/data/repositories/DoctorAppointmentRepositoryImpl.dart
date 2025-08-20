import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featuresForDoctor/DoctorAppointments/domain/repositories/DoctorAppointmentRepository.dart';
import '../datasources/DoctorAppointmentRemoteDataSource.dart';

class DoctorAppointmentRepositoryImpl extends DoctorAppointmentRepository {
  final DoctorAppointmentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  DoctorAppointmentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });
  @override
  Future<Either<Failure, List<AppointmentRequired>>> getAppointment({
    required int pageDate,
  }) async {
    if (!await networkInfo.isConnected) {
      return left(NetworkFailure());
    }
    try {
      var result = await remoteDataSource.getDoctorWaitingAppointment(
        pageDate: pageDate,
      );
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNewAppointment({
    required String name,
    required String phone,
    String? email,
    required String date,
    required String time,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    } else {
      try {
        bool result = await remoteDataSource.addNewAppointment(
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
  Future<Either<Failure, List<AppointmentRequired>>> getBookingAppointments({required int pageDate}) async {
    if (!await networkInfo.isConnected) {
      return left(NetworkFailure());
    }
    try {
      var result = await remoteDataSource.getDoctorBookingAppointment(
        pageDate: pageDate,
      );
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
