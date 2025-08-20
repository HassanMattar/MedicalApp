import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_otp/email_otp.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Network/NetworkInfo.dart';
import '../../../../../Core/Routing/Routing.dart';
import '../../../../../Core/Widget/snakeBar.dart';

class SignUpFirstController extends GetxController {
  TextEditingController gmail = TextEditingController();
  NetworkInfo networkInfo = Get.find<NetworkInfo>();
  Future<void> SignUp(isDoctor, context) async {
    if (!await networkInfo.isConnected) {
      showSnakeBar(
        status: false,
        text: "تأكد من الاتصال بالانترنت ",
        context: context,
      );
      return;
    }
   else{
     if (await EmailOTP.sendOTP(email: gmail.text)) {
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
      showSnakeBar(
        status: false,
        text: "تأكد من كتابة الجيميل بشكل صحيح",
        context: context,
      );
    }
   }
  }
}
