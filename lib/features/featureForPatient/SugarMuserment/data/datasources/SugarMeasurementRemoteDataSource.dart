import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/constant.dart';

import '../../../../../Core/Error/exceptions.dart';

abstract class SugarMeasurementRemoteDataSource {
  Future<bool> AddSugarMeasure({
    required String type,
    required String date,
    required String time,
  });
}

class SugarMeasurementRemoteDataSourceImpl
    extends SugarMeasurementRemoteDataSource {
  @override
  Future<bool> AddSugarMeasure({
    required String type,
    required String date,
    required String time,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: "/readings/",
        data: {"type": type, "date": convertDateFormat(date), "time": time},
      );
      if (response.statusCode == 201) {
        return Future.value(true);
      } else
        return false;
    } catch (err) {
      throw ServerException();
    }
  }
}
