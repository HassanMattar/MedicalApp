import 'package:dio/dio.dart';
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Error/exceptions.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorFavoriteModel.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/data/models/DoctorListModel%20.dart';

abstract class DoctorInPatientRemoteDataSource {
  Future<List<DoctorListModel>> getAllDoctor();
  Future<List<DoctorFavoriteModel>> getAllFavoriteDoctor();

  Future<bool> AddFavoriteForDoctor({required int doctorId});
  Future<bool> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  });

  Future<bool> removeFavoriteForDoctor({required int doctorId});
}

class DoctorInPatientRemoteDataSourceImpl
    extends DoctorInPatientRemoteDataSource {
  @override
  Future<List<DoctorListModel>> getAllDoctor() async {
    try {
      final response = await DioHelper.getData(url: "/doctors/");
      print("*************$response");
      if (response.statusCode == 200) {
        return Future.value(
          DoctorListModel.listFromJson(response.data['results']),
        );
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (err) {
      print(err);
      throw ServerException;
    }
  }

  @override
  Future<bool> AddFavoriteForDoctor({required int doctorId}) async {
    try {
      final response = await DioHelper.postData(
        url: "/doctors/$doctorId/favorite/",
      );
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 200) {
        return false;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      throw ServerException;
    }
  }

  @override
  Future<bool> UpDateDoctorRating({
    required int doctorId,
    required double rating,
  }) {
    return Future.value(true);
  }

  @override
  Future<List<DoctorFavoriteModel>> getAllFavoriteDoctor() async {
    try {
      final response = await DioHelper.getData(url: "/doctors/favorites/");
      print("*************$response");
      if (response.statusCode == 200) {
        final List data = response.data as List;
        print(data[0]["doctor"]);
        final doctors = data
            .map((item) => DoctorFavoriteModel.fromJson(item['doctor']))
            .toList();
        print(doctors);
        return (doctors);
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (err) {
      throw ServerException;
    }
  }
  
  @override
  Future<bool> removeFavoriteForDoctor({required int doctorId}) async {
      try {
      final response = await DioHelper.postData(
        url: "/doctors/$doctorId/unfavorite/",
      );
      print("*************$response");
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      throw ServerException;
    }
  }
}
