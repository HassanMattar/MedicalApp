import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/Widget/MyElevatedButton.dart';
import 'package:medical2/Widget/MyTextFormField.dart';
import 'package:medical2/Widget/showBicker.dart';

import '../Controller/DoctorMyInfoController.dart';

// ignore: must_be_immutable
class DoctorMyInfoPage extends StatelessWidget {
  DoctorMyInfoController controller = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("البيانات الشخصية", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الاسم كامل"),

                MyTextFormField(
                  controller: controller.nameController,
                  hintText: "الاسم كامل",
                ),
                Text("العنوان"),
                MyTextFormField(
                  validator: validatorMethod,
                  controller: controller.addressController,
                  hintText: "العنوان",
                ),
                Text("رقم التلفون"),
                MyTextFormField(
                  validator: validatorMethod,
                  textInputType: TextInputType.phone,
                  controller: controller.phoneController,
                  hintText: "0590000000",
                ),
                Text("البريد الالكتروني"),
                MyTextFormField(
                  controller: controller.emailController,
                  hintText: "example@email.com",
                ),
                Text("وقت العمل"),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        validator: validatorMethod,
                        controller: controller.fromTimeController,
                        hintText: "00:00",
                        prefixIcon: Icon(Icons.access_time),
                        onTap: () {
                          selectTime(controller.fromTimeController, context);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextFormField(
                        validator: validatorMethod,
                        controller: controller.toTimeController,
                        hintText: "00:00",
                        prefixIcon: Icon(Icons.access_time),
                        onTap: () {
                          selectTime(controller.toTimeController, context);
                        },
                      ),
                    ),
                  ],
                ),
                Text("المؤهلات"),
                MyTextFormField(
                  validator: validatorMethod,
                  controller: controller.qualificationsController,
                  hintText: "اكتب مؤهلاتك العلمية بإيجاز",
                ),
                const SizedBox(height: 20),
            
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(20),
    child: SizedBox(
      height: 48,
      width: double.infinity,
      child: MyElevatedButton(
                    text: "حفظ",
                    controller: () {
                      if (formKey.currentState!.validate()) {
                        controller.save(context);
                      }
                    },
                  ),
    ),
    ));
  }
}
