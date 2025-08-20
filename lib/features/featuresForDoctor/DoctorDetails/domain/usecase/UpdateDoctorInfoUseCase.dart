// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart' show Failure;
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/repositories/DoctorDetailRepository.dart';

class UpdateDoctorInfoUseCase {
  DoctorDetailRepository repository;
  UpdateDoctorInfoUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required String name,
    required String address,
    required String phone,
    required String fromTime,
    required String toTime,
    required String qualifications,
  }) async {
    return await repository.updateDoctorInfo(
      name: name,
      address: address,
      phone: phone,
      fromTime: fromTime,
      toTime: toTime,
      qualifications: qualifications
    );
  }
}
