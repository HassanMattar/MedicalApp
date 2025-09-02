import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/GetMedicalDataUseCase.dart';

class MedicalDataPatientForDoctorController extends GetxController {
  RxString diabetesType = 'النوع الأول'.obs;
  TextEditingController descriptionController = TextEditingController();
  RxList files = [].obs;
  GetMedicalDataForPatientInDoctorUseCase useCase;
  MedicalDataPatientForDoctorController({required this.useCase});

  @override
  void onInit() async {
    super.onInit();
    var result = await useCase(patient_Id: 10);
    result.fold((l) {}, (r) {
      diabetesType.value = "r.name!";
      files = [].obs;
      descriptionController.text = "***************";
    });
  }
}
