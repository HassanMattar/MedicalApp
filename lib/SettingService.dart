import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:get/get.dart';
import 'package:medical2/Core/Dio/DioHelper.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';

class SettingServices extends GetxService {
  
  late NetworkInfo networkInfo;
  late InternetConnectionChecker internetConnectionChecker;
 

  Future<SettingServices> init() async {
    internetConnectionChecker = InternetConnectionChecker.createInstance();
    DioHelper.init();
    networkInfo = new NetworkInfoImpl(
      connectionChecker: internetConnectionChecker,
    );
    return this;
  }
}
