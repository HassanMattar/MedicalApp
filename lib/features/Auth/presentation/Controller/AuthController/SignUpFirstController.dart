import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_otp/email_otp.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import 'package:medical2/SettingService.dart';
import '../../../../../Core/Routing/Routing.dart';
import '../../../../../Core/Widget/snakeBar.dart';

class SignUpFirstController extends GetxController {
  TextEditingController gmail = TextEditingController();
  NetworkInfo networkInfo = Get.find<SettingServices>().networkInfo;
  RxBool isLoading = false.obs;

  Future<void> SignUp(isDoctor, context) async {
    
    isLoading.value = !isLoading.value;
    if (!await networkInfo.isConnected) {
          isLoading.value = !isLoading.value;
      showSnakeBar(
        status: false,
        text: "تأكد من الاتصال بالانترنت ",
        context: context,
      );
      return;
    } else {
      try{
         bool isSend =await EmailOTP.sendOTP(email: gmail.text);
      if (isSend) {
        isLoading.value = !isLoading.value;
        print("**********************${EmailOTP.getOTP()}");
        showSnakeBar(
          status: true,
          text: "تم ارسال رمز التأكيد",
          context: context,
        );

        Get.toNamed(
          Routes.otp,
          arguments: {
            'isDoctor': isDoctor,
            'comeFromSignUP': true,
            "email": gmail.text,
          },
        );
      } else {
         isLoading.value = !isLoading.value;
        showSnakeBar(
          status: false,
          text: "تأكد من كتابة الجيميل بشكل صحيح",
          context: context,
        );
      }
      }catch(err){
         isLoading.value = !isLoading.value;
         showSnakeBar(
          status: false,
          text: "تأكد من كتابة الجيميل بشكل صحيح",
          context: context,
        );
      }
    
    }
  }
}
