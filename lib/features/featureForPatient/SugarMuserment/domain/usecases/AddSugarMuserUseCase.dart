// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';

import '../repositories/SugerMusermentRepository.dart';

class AddSugarMuserUseCase {
  SugarMeasurementRepository repository;
  AddSugarMuserUseCase({
    required this.repository,
  });
  Future<Either<Failure,bool>> call({
     required String type,
    required String date,
    required String time,
  
  })async{
   return await repository.AddSugarMeasure(type:type, date:date, time:time);
  }
}
