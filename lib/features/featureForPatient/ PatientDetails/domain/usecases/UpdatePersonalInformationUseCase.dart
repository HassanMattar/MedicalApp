import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/repositories/PatientDetailsRepository.dart';

class UpdatePersonalInformationUseCase {
  PatientDetailsRepository repository;
  UpdatePersonalInformationUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required String email,
    required String address,
    required String gender,
    required String name,
    required String barth,
    required String tel,
  }) {
    return repository.UpdatePersonalInformation(
      email: email,
      address: address,
      gender: gender,
      name: name,
      barth: barth,
      tel: tel,
    );
  }
}
