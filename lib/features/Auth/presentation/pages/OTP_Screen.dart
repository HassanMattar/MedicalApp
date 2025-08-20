import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../Controller/AuthController/OTP_Controller.dart';
import '../../../../Widget/MyElevatedButton.dart';

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key, required this.comeFromSignUP, required this.isDoctor,required this.email})
    : super(key: key);

  bool isDoctor;
  bool comeFromSignUP;
  String email;

  OtpController controller = Get.find<OtpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_forward, color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "أدخل رمز التحقق",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "تم إرسال رسالة مكونة من 4 أرقام على بريدك الإلكتروني",
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              Text(
                "Email@gmail.com",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Directionality(
                textDirection: TextDirection.ltr,
                child: OtpTextField(
                  numberOfFields: 4,

                  fieldWidth: 50,
                  showCursor: false,

                  showFieldAsBox: true,
                  focusedBorderColor: Color(0xff407BFF),

                  onSubmit: (String verificationCode) {
                  
                    controller.verificationCode.value = verificationCode;
                    controller.submit(
                      email: email,
                      isComeFromSignUP: comeFromSignUP,
                      context: context,
                    );
                  }, // end onSubmit
                ),
              ),
              const SizedBox(height: 30),
              MyElevatedButton(
                controller: () {
                  controller.submit(
                    email: email,
                    isComeFromSignUP: comeFromSignUP,
                    context: context,
                  );
                },
                text: "استمرار",
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  controller.submit(
                    email: email,
                    isComeFromSignUP: comeFromSignUP,
                    context: context,
                  );
                },
                child: Text("لم يصلك الرمز؟ أعد إرسال الرمز"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
