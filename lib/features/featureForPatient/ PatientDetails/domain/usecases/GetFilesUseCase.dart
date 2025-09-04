
import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/FileEntity.dart';

import '../repositories/PatientDetailsRepository.dart';
class GetFilesUseCase {
  PatientDetailsRepository repository;
  GetFilesUseCase({required this.repository});
  Future<Either<Failure,  List<FileEntity>>> call() {
    return repository.GetFiles();
  }
}