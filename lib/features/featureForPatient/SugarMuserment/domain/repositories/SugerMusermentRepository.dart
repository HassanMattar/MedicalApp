import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

abstract class SugarMeasurementRepository {
Future<Either<Failure,bool>>  AddSugarMeasure({
     required String type,
    required String date,
    required String time,
  
  });
}
