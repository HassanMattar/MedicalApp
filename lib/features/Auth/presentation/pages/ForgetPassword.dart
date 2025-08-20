// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/AuthController/ForgetPasswordController.dart';
import '../../../../Core/constant.dart';
import '../../../../Widget/MyElevatedButton.dart';
import '../../../../Widget/MyTextFormField.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  bool isDoctor;
  ForgetPasswordScreen({Key? key, required this.isDoctor}) : super(key: key);
  ForgetMyPasswordController controller = Get.find<ForgetMyPasswordController>();
   final _formKey = GlobalKey<FormState>();
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
          child: Form(
                   key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "نسيت كلمة السر",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "استرجع كلمة سر حسابك",
                  style: TextStyle(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                MyTextFormField(
                  controller: controller.email,
                    validator:validatorMethod,
                  hintText: "البريد الالكتروني",
                  prefixIcon: Icon(Icons.email),
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                MyElevatedButton(
                  controller: () {
                    if (_formKey.currentState!.validate()) {
                      controller.submit(isDoctor,context);
                    }
                  },
                  text: "استمرار",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
