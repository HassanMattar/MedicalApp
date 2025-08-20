import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';

import '../../../../Auth/domain/entities/DoctorEntity.dart';

abstract class DoctorInPatientRemoteDataSource {
  Future<List<Doctor>> getAllDoctor();
  Future<List<Doctor>> getAllFavoriteDoctor();

  Future<bool> AddFavoriteForDoctor({required int doctorId});
  Future<bool> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  });
}

class DoctorInPatientRemoteDataSourceImpl
    extends DoctorInPatientRemoteDataSource {
  @override
  Future<List<Doctor>> getAllDoctor() {
    try {
      return Future.value(allDoctors);
    } catch (err) {
      throw ServerException;
    }
  }

  @override
  Future<bool> AddFavoriteForDoctor({required int doctorId}) {
    return Future.value(true);
  }

  @override
  Future<bool> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  }) {
    return Future.value(true);
  }

  @override
  Future<List<Doctor>> getAllFavoriteDoctor() {
    try {
      return Future.value(allDoctors);
    } catch (err) {
      throw ServerException;
    }
  }
}
