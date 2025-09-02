// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

import '../../../../../Core/Error/FailureToString.dart';
import '../../../../Auth/domain/entities/DoctorEntity.dart';
import '../../domain/usecases/GetAllFavoriteDoctorUseCase.dart';

class ShowDoctorsController extends GetxController {
  RxList<DoctorEntity> allDoctors = <DoctorEntity>[].obs;
  RxList<DoctorEntity> filteredDoctors = <DoctorEntity>[].obs;
  TextEditingController searchController = TextEditingController();
  GetAllFavoriteDoctorUseCase getAllFavoriteDoctorUseCase;
  RxBool isLoading = false.obs;
  ShowDoctorsController({required this.getAllFavoriteDoctorUseCase});
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchText = searchController.text.trim();
    filteredDoctors.value = allDoctors
        .where((doctor) => doctor.username.contains(searchText))
        .toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> getAllFavoriteDoctor(context) async {
    isLoading.value = true;
    var result = await getAllFavoriteDoctorUseCase();
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
      },
      (r) {
        allDoctors.value = r;
          filteredDoctors.value = r;
        isLoading.value = false;
      },
    );
  }
}
