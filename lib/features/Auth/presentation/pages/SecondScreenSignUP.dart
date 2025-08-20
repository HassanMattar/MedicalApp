// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/SignUpController.dart';
import 'package:medical2/Core/constant.dart';

import '../../../../Core/Routing/Routing.dart';
import '../../../../Widget/MyElevatedButton.dart';
import '../../../../Widget/MyPasswordTextFiled.dart';
import '../../../../Widget/MyTextFormField.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  bool isDoctor;
  String email;
  SignUpScreen({Key? key, required this.isDoctor, required this.email})
    : super(key: key);
  SignUpController controller = Get.find<SignUpController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: const Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: const Text(
                      'أنشئ حسابك الجديد',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("الاسم الكامل"),
                  MyTextFormField(
                    hintText: 'الاسم الكامل',
                    validator: validatorMethod,
                    prefixIcon: Icon(Icons.person),
                    controller: controller.name,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 12),
                  Text("البريد الإلكتروني"),
                  MyTextFormField(
                    validator: validatorMethod,
                    hintText: 'البريد الإلكتروني',

                    prefixIcon: Icon(Icons.email),
                    controller: controller.email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  Text("كلمة السر"),
                  Obx(
                    () => MyPasswordTextFiled(
                      validator: validatorMethod,

                      visible: controller.visible.value,
                      changeVisible: () {
                        controller.visible.value = !controller.visible.value;
                      },
                      controller: controller.password1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("تأكيد كلمة السر"),
                  Obx(
                    () => MyPasswordTextFiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        if (controller.password1.text ==
                            controller.password.text) {
                          return 'كلمة السر غير متطابقة';
                        }
                        return null;
                      },
                      visible: controller.visible.value,
                      changeVisible: () {
                        controller.visible.value = !controller.visible.value;
                        print(email);
                        ;
                      },
                      controller: controller.password,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () =>controller.isLoading.value?  MyElevatedButton(
                      controller: () {
                        if (_formKey.currentState!.validate()) {
                          controller.SignUp(
                            isDoctor: isDoctor,
                            context: context,
                          );
                        }
                      },
                      text: "إنشاء حساب",
                    ):  Center(
                      child: CircularProgressIndicator(
                           color:Color(0xff407BFF),
                           
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('هل لديك حساب؟', style: TextStyle()),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.login,
                            arguments: {'isDoctor': isDoctor},
                          );
                          ;
                        },
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: Color(0xFF4D74F9)),
                        ),
                      ),
                    ],
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
