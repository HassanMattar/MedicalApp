// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/NewPasswordController.dart';
import '../../../../Core/constant.dart';
import '../../../../Widget/MyElevatedButton.dart';
import '../../../../Widget/MyPasswordTextFiled.dart';

// ignore: must_be_immutable
class NewPasswordScreen extends StatelessWidget {
  NewPasswordController controller = Get.find<NewPasswordController>();
  final _formKey = GlobalKey<FormState>();
  String email;
  NewPasswordScreen({Key? key, required this.isDoctor, required this.email}) : super(key: key);
  bool isDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: const Text(
                      "إنشاء كلمة سر جديدة",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: const Text(
                      'أدخل كلمة السر الجديدة',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("كلمة السر"),
                  Obx(
                    () => MyPasswordTextFiled(
                      validator: validatorMethod,
                      visible: controller.visible.value,
                      changeVisible: () {
                        controller.visible.value = !controller.visible.value;
                      },
                      controller: controller.password,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("تأكيد كلمة السر"),
                  MyPasswordTextFiled(
                    visible: controller.visible.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      if (controller.password.value ==
                          controller.password.value) {
                        return 'كلمة السر غير متطابقة';
                      }
                      return null;
                    },
                    changeVisible: () {
                      controller.visible.value = !controller.visible.value;
                    },
                    controller: controller.confirmPassword,
                  ),
                  const SizedBox(height: 12),
                  MyElevatedButton(
                    controller: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submit(context: context, isDoctor: isDoctor, email:email);
                      }
                    },
                    text: 'إنشاء كلمة سر جديدة',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
