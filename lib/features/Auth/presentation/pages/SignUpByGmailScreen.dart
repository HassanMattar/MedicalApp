// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/SignUpFirstController.dart';

import '../../../../Core/Routing/Routing.dart';
import '../../../../Core/constant.dart';
import '../../../../Widget/MyElevatedButton.dart';
import '../../../../Widget/MyTextFormField.dart';

// ignore: must_be_immutable
class SignUpByGmailScreen extends StatelessWidget {
  SignUpFirstController controller = Get.find<SignUpFirstController>();
  bool isDoctor;

  SignUpByGmailScreen({Key? key, required this.isDoctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "حساب جديد",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Illustration placeholder
                  Container(
                    height: 180,
                    child: Image.asset('images/login.png'),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    child: Text("البريد الإلكتروني"),
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(height: 5),
                  MyTextFormField(
                    validator: validatorMethod,
                    controller: controller.gmail,
                    hintText: 'email@gmail.com',
                    prefixIcon: Icon(Icons.email),
                    textInputType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),
                 Obx(() {
                  return !controller.isLoading.value
                        ? MyElevatedButton(
                            controller: () async {
                              await controller.SignUp(isDoctor, context);
                            },
                            text: "استمر باستخدام البريد الالكتروني",
                          )
                        : CircularProgressIndicator();
                  }),
                  SizedBox(height: 15),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('هل لديك حساب؟', style: TextStyle()),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(
                              Routes.login,
                              arguments: {'isDoctor': isDoctor},
                            );
                          },
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(color: Color(0xFF4D74F9)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
