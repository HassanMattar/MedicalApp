// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/LoginController.dart';

import '../../../../Core/Routing/Routing.dart';
import '../../../../Core/constant.dart';
import '../../../../Widget/MyElevatedButton.dart';
import '../../../../Widget/MyPasswordTextFiled.dart';
import '../../../../Widget/MyTextFormField.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final bool isDoctor;
  LoginController controller = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key, required this.isDoctor});
  @override
  Widget build(BuildContext context) {
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        height: 180,
                        child: Image.asset('images/login.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("البريد الإلكتروني"),
                    const SizedBox(height: 5),
                    MyTextFormField(
                      controller: controller.gmail,
                      hintText: 'email@gmail.com',

                      prefixIcon: Icon(Icons.email),
                     validator:validatorMethod,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    Text("كلمة السر"),
                    const SizedBox(height: 5),
                    Obx(
                      () => MyPasswordTextFiled(
                        visible: controller.visible.value,

                        validator:validatorMethod,
                        changeVisible: () {
                          controller.visible.value = !controller.visible.value;
                        },
                        controller: controller.password,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.forgetPasswordScreen,
                            arguments: {'isDoctor': isDoctor},
                          );
                        },
                        child: Text(
                          "هل نسيت كلمة السر؟",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  Obx(()=>  controller.isLoading.value?
                    Center(
                      child: CircularProgressIndicator(
                           color:Color(0xff407BFF),
                           
                      ),
                    ):MyElevatedButton(
                        controller: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login(isDoctor: isDoctor,context: context);
                          }
                        },
                        text: "تسجيل الدخول",
                      ),),
                    SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('ليس لديك حساب؟', style: TextStyle()),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(
                                Routes.signUP1,
                                arguments: {'isDoctor': isDoctor},
                              );
                            },
                            child: const Text(
                              'إنشاء حساب',
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
      ),
    );
  }
}
