// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/entities/DoctorProfileEntity.dart';
import '../../domain/usecase/GetDoctorInfoUseCase.dart';
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

  late DoctorProfileEntity doctor;
  @override
  Future<void> onInit() async {
    super.onInit();
    var result = await getDoctorMyInfoUseCase();
    result.fold((l) {}, (r) {
     
      this.doctor = r;
       print( doctor.workingHours.split(" "));
      emailController.text = doctor.email;
      phoneController.text = doctor.phoneNumber ?? "";
      addressController.text = doctor.address ?? "";
      qualificationsController.text = doctor.bio ?? "";
      fromTimeController.text = doctor.workingHours.isEmpty?"": "${doctor.workingHours.split(" ")[2]} ${doctor.workingHours.split(" ")[3]}";
      toTimeController.text = doctor.workingHours.isEmpty?"":"${doctor.workingHours.split(" ")[5]} ${doctor.workingHours.split(" ")[6]}";
    });
  }

  void save(context) async {
    DoctorProfileEntity doctor = DoctorProfileEntity(
      fullName: nameController.text,

      email: emailController.text,
      address: addressController.text,
      phoneNumber: phoneController.text,
      bio: qualificationsController.text,
      workingHours:
          " من الساعة ${fromTimeController.text} الى ${toTimeController.text} ",
    );
    var result = await updateDoctorInfoUseCase(doctor: doctor);
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
      },
      (r) {
        showSnakeBar(context: context, status: true, text: "تمت العملية بنجاح");
      },
    );
  }
}
