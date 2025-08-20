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
  }) {
    try {
      return Future.value(true);
    } catch (err) {
      throw ServerException();
    }
  }
}
