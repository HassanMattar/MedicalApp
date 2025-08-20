import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Widget/MyElevatedButton.dart';
import '../../../../../Widget/MyTextFormField.dart';
import '../../../../../Widget/showBicker.dart';
import '../Controller/personalInfoController.dart';

// ignore: must_be_immutable
class PatientInfoPage extends StatelessWidget {
  PatientInfoPage({super.key});
  PatientInfoController controller = Get.find<PatientInfoController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'البيانات الشخصية',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  MyTextFormField(
                    hintText: 'الاسم كامل',
                    controller: controller.fullNameController,
                  ),
                  const SizedBox(height: 12),
                  MyTextFormField(
                    hintText: 'العنوان',
                    controller: controller.addressController,
                  ),
                  const SizedBox(height: 12),
                  buildDropdownField(),
                  const SizedBox(height: 12),
                  MyTextFormField(
                    controller: controller.barthDateController,
                    hintText: 'تاريخ الميلاد',
                    prefixIcon: const Icon(Icons.calendar_today),
                    onTap: () {
                      selectDate(controller.barthDateController, context);
                    },
                  ),
                  const SizedBox(height: 12),
                  MyTextFormField(
                    hintText: 'رقم التلفون',
                    controller: controller.phoneNumberController,
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  MyTextFormField(
                    hintText: 'البريد الالكتروني',
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: MyElevatedButton(
                      controller: () async {
                        if (_formKey.currentState!.validate()) {
                         await controller.submit(context);
                        }
                      },
                      text: 'حفظ',
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

  Widget buildDropdownField() {
    return Obx(
      () => DropdownButtonFormField<String>(
        value: controller.gender.value,
        decoration: InputDecoration(
          labelText: 'الجنس',
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: controller.genderOptions
            .map((value) => DropdownMenuItem(value: value, child: Text(value)))
            .toList(),
        onChanged: (val) {
          controller.gender.value = val!;
        },
      ),
    );
  }
}
