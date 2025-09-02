import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../Core/Routing/Routing.dart';
import '../../../../../Core/TokenService/TokenService.dart';

class OnBoardingController extends GetxController {
  var pageController = PageController();
  RxInt currentPage = 0.obs;
  final TokenService _tokenService = Get.put(TokenService());

  RxString selectedRole = "المريض".obs;

  void onPageChanged(int index) => currentPage.value = index;

  dynamic submit() async {
    if (selectedRole.value == "الطبيب") {
     
      Get.toNamed(Routes.login, arguments: {"isDoctor": true});
    } else {
     
      Get.toNamed(Routes.login, arguments: {"isDoctor": false});
    }
  }
}
