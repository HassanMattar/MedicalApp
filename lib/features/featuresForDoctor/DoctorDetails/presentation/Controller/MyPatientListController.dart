
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';

import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/Auth/domain/entities/patientEntity.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/usecase/GetMyPatientUseCase.dart';


class MyPatientController extends GetxController {
  RxList<Patient> allPatients = <Patient>[].obs;
  RxList<Patient> filteredPatients = <Patient>[].obs;
  TextEditingController searchController = TextEditingController();
  GetMyPatientUseCase getMyPatientUseCase;
 

  RxBool isLoading = false.obs;
  MyPatientController({
    required this.getMyPatientUseCase,

  });
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchText = searchController.text.trim();
    filteredPatients.value = allPatients
        .where((doctor) => doctor.name!.contains(searchText))
        .toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> getAllPatient(context) async {
    isLoading.value = true;
    print("*********${isLoading.value}****************");
    var result = await getMyPatientUseCase();
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
      },
      (r) {
        allPatients.value = r;
        filteredPatients.value = r;
        isLoading.value = false;
        print(r);
      },
    );
  }

}
