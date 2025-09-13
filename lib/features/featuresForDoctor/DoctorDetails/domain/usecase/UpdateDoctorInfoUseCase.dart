// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart' show Failure;
import 'package:medical2/features/featuresForDoctor/DoctorDetails/data/models/DoctorProfileModel.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/entities/DoctorProfileEntity.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/repositories/DoctorDetailRepository.dart';

class UpdateDoctorInfoUseCase {
  DoctorDetailRepository repository;
  UpdateDoctorInfoUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required DoctorProfileEntity doctor
  }) async {
    return await repository.updateDoctorInfo(
    doctor: DoctorProfileModel(address: doctor.address, fullName:doctor.fullName, phoneNumber: doctor.phoneNumber,
     email:doctor.email, workingHours: doctor.workingHours, bio: doctor.bio,)
    );
  }
}
