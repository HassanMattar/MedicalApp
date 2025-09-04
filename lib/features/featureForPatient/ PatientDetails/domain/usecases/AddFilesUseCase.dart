// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/repositories/PatientDetailsRepository.dart';

class AddFilesUseCase {
  PatientDetailsRepository repository;
  AddFilesUseCase({required this.repository});
  Future<Either<Failure, bool>> call({required List<dynamic> selectedFiles}) {
    return repository.AddFiles(selectedFiles: selectedFiles);
  }
}
