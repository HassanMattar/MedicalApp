// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import '../../domain/usecase/GetDoctorInfoUseCase.dart';


import '../../../../Auth/domain/entities/DoctorEntity.dart';
import '../../domain/usecase/UpdateDoctorInfoUseCase.dart';

class DoctorMyInfoController extends GetxController {
  GetDoctorMyInfoUseCase getDoctorMyInfoUseCase;
  UpdateDoctorInfoUseCase updateDoctorInfoUseCase;
  DoctorMyInfoController({
    required this.getDoctorMyInfoUseCase,
    required this.updateDoctorInfoUseCase,
  });
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final fromTimeController = TextEditingController();
  final toTimeController = TextEditingController();
  final qualificationsController = TextEditingController();

  late Doctor doctor;
  @override
  Future<void> onInit() async {
    super.onInit();
    var result = await getDoctorMyInfoUseCase();
    result.fold((l) {}, (r) {
      this.doctor = r;
      emailController.text = doctor.email;
      phoneController.text = doctor.phoneNumber ?? "";
      addressController.text = doctor.address ?? "";
      qualificationsController.text = doctor.qualification ?? "";
    });
  }


  void save(context) async {
    var result = await updateDoctorInfoUseCase(
      address: addressController.text,
      fromTime: fromTimeController.text,
      toTime: toTimeController.text,
      name: nameController.text,
      phone: phoneController.text,
      qualifications: qualificationsController.text,
    );
    result.fold((l) {
      showSnakeBar(
        context: context,
        status: false,
        text: mapFailureToMessage(l),
      );
    }, (r) {
       showSnakeBar(
        context: context,
        status: true,
        text:"تمت العملية بنجاح",
      );
    });
  }
}
