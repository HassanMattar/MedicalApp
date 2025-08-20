import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/constant.dart';
import '../../../../../Widget/MyElevatedButton.dart';
import '../../../../../Widget/MyTextFormField.dart';
import '../../../../../Widget/showBicker.dart';
import '../Controller/AddNewAppointmentController.dart'
    show AddNewAppointmentController;

// ignore: must_be_immutable
class AddNewAppointmentPage extends StatelessWidget {
  AddNewAppointmentController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'مراجعة جديدة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'يرجى تحديد التاريخ ووقت المراجعة الجديدة للمريض',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "اسم المريض",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  MyTextFormField(
                    hintText: 'اسم المريض',
                    validator: validatorMethod,
                    controller: controller.nameController,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "تاريخ المراجعة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MyTextFormField(
                    validator: validatorMethod,
                    controller: controller.dateController,
                    hintText: "00/00/0000",
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    onTap: () {
                      selectDate(controller.dateController, context);
                    },
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    "وقت المراجعة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MyTextFormField(
                    controller: controller.timeController,
                    validator: validatorMethod,
                    hintText: "00:00",
                    prefixIcon: Icon(Icons.access_time),
                    onTap: () {
                      selectTime(controller.timeController, context);
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "البريد الالكتروني",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  MyTextFormField(
                    hintText: 'البريد الالكتروني',
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "رقم التلفون",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MyTextFormField(
                    validator: validatorMethod,
                    hintText: 'رقم التلفون',
                    controller: controller.phoneController,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: !controller.isLoading.value
                          ? MyElevatedButton(
                              controller: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.saveAppointment(context);
                                }
                              },
                              text: 'حفظ',
                            )
                          : CircularProgressIndicator(),
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
