// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_otp/email_otp.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';

import '../../../../../Core/Routing/Routing.dart';

class ForgetMyPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
 

  Future<void> submit(isDoctor,context) async {
     if (await EmailOTP.sendOTP(email: email.text)) {
      showSnakeBar(
        status: true,
        text: "تم ارسال رمز التأكيد",
        context: context,
      );

        Get.toNamed(
      Routes.otp,
      arguments: {'isDoctor': isDoctor, 'comeFromSignUP': false,"email":email.text},
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
