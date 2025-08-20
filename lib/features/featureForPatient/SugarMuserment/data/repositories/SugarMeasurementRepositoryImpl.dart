import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';
import '../../domain/repositories/SugerMusermentRepository.dart';
import '../datasources/SugarMeasurementRemoteDataSource.dart';

class SugarMeasurementRepositoryImpl extends SugarMeasurementRepository {
  final SugarMeasurementRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final TokenService tokenService;
  SugarMeasurementRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.tokenService,
  });
  @override
  Future<Either<Failure, bool>> AddSugarMeasure({
    required String type,
    required String date,
    required String time,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      var result = await remoteDataSource.AddSugarMeasure(
        type: type,
        date: date,
        time: time,
      );
      return Right(result);
    } on ServerException {
      return await left(ServerFailure());
    }
  }
}
