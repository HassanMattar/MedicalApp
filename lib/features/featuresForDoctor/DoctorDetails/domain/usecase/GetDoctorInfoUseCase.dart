// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/entities/DoctorProfileEntity.dart';

import '../repositories/DoctorDetailRepository.dart';

class GetDoctorMyInfoUseCase {
  DoctorDetailRepository repository;
  GetDoctorMyInfoUseCase({
    required this.repository,
  });

 Future<Either<Failure,DoctorProfileEntity>> call() {
    return repository.getDoctorMyInfo();
  }
}
