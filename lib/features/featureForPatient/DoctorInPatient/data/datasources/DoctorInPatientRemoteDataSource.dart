import 'package:dio/dio.dart';
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorModel.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

import '../../../../Auth/domain/entities/DoctorEntity.dart';

abstract class DoctorInPatientRemoteDataSource {
  Future<List<DoctorEntity>> getAllDoctor();
  Future<List<DoctorEntity>> getAllFavoriteDoctor();

  Future<bool> AddFavoriteForDoctor({required int doctorId});
  Future<bool> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  });
}

class DoctorInPatientRemoteDataSourceImpl
    extends DoctorInPatientRemoteDataSource {
  @override
  Future<List<DoctorEntity>> getAllDoctor() {
    try {
      final allDoctors = [
        DoctorEntity(
          address: "",
          id: 10,
          username: '',
          specialty: '',
          phoneNumber: '',
          bio: '',
          workingHours: '',
          isAvailable: false,
          averageRating: '',
          isFavorited: true,
        ),
        DoctorEntity(
          address: "",
          id: 10,
          username: '',
          specialty: '',
          phoneNumber: '',
          bio: '',
          workingHours: '',
          isAvailable: false,
          averageRating: '',
          isFavorited: true,
        ),
        DoctorEntity(
          address: "",
          id: 10,
          username: '',
          specialty: '',
          phoneNumber: '',
          bio: '',
          workingHours: '',
          isAvailable: false,
          averageRating: '',
          isFavorited: true,
        ),
        DoctorEntity(
          address: "",
          id: 10,
          username: '',
          specialty: '',
          phoneNumber: '',
          bio: '',
          workingHours: '',
          isAvailable: false,
          averageRating: '',
          isFavorited: true,
        ),
      ];

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
  Future<List<DoctorEntity>> getAllFavoriteDoctor() async {
    try {
      final response = await DioHelper.getData(url: "/doctors/favorites/");
      print("*************$response");
      if (response.statusCode == 200) {
        return Future.value(DoctorModel.fromJsonList(response.data));
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (err) {
      throw ServerException;
    }
  }
}
