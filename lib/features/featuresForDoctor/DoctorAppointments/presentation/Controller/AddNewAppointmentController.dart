// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';

import 'package:medical2/features/featuresForDoctor/DoctorAppointments/domain/usecases/AddNewAppointmentUseCase.dart';

class AddNewAppointmentController extends GetxController {
  AddNewAppointmentUseCase addNewAppointmentUseCase;
  AddNewAppointmentController({required this.addNewAppointmentUseCase});

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final isLoading = false.obs;
  @override
  void onClose() {
    nameController.dispose();
    dateController.dispose();
    timeController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void saveAppointment(context) async {
    isLoading.value=true;
    var result = await addNewAppointmentUseCase(
      date: dateController.text,
      name: nameController.text,
      phone: phoneController.text,
      time: timeController.text,
      email: emailController.text,
    );
    result.fold(
      (l) => {
      

        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        ),
              isLoading.value=false
      },
      (r) => {
        showSnakeBar(context: context, status: true, text: "تمت العملية بنجاح"),
           isLoading.value=false},
    );
  }
}
