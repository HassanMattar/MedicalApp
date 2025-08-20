import 'package:email_otp/email_otp.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';

import '../../../../../Core/Routing/Routing.dart';

class OtpController extends GetxController {
  RxString verificationCode = "".obs;
  void submit({required isComeFromSignUP, required String email,required context}) {
    EmailOTP.getOTP();
    if (EmailOTP.getOTP() == verificationCode.value) {
      showSnakeBar(status: true, text: "تمت العملية بنجاح", context: context);
      isComeFromSignUP
          ? Get.toNamed(Routes.signUP, arguments: {'isDoctor': true,"email":email})
          : Get.toNamed(Routes.newPasswordScreen, arguments: {'isDoctor': true,"email":email});
    } else if (EmailOTP.isOtpExpired()) {
      showSnakeBar(
        status: false,
        text: "انتهت صلاحية رمز التأكيد ",
        context: context,
      );
    } else {
      showSnakeBar(status: false, text: "رمز التأكيد خاطئ", context: context);
    }
  }
}
