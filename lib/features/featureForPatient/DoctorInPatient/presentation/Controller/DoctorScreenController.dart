// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medical2/Core/Widget/snakeBar.dart';

import '../../../../../Core/Error/FailureToString.dart';
import '../../../../Auth/domain/entities/DoctorEntity.dart';
import '../../domain/usecases/AddFavoriteUseCase.dart';
import '../../domain/usecases/GetAllDoctorUseCase.dart';
import '../../domain/usecases/UpDateRatingUseCase.dart';

class     DoctorScreenController extends GetxController {
  RxList<Doctor> allDoctors = <Doctor>[].obs;
  RxList<Doctor> filteredDoctors = <Doctor>[].obs;
  TextEditingController searchController = TextEditingController();
  GetAllDoctorUseCase getAllDoctorUseCase;
  UpdateRatingUseCase updateRatingUseCase;
  AddFavoriteUseCase addFavoriteUseCase;

  RxBool isLoading = false.obs;
  DoctorScreenController({
    required this.getAllDoctorUseCase,
    required this.addFavoriteUseCase,
    required this.updateRatingUseCase,
  });
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchText = searchController.text.trim();
    filteredDoctors.value = allDoctors
        .where((doctor) => doctor.name!.contains(searchText))
        .toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> getAllDoctor(context) async {
    isLoading.value = true;
    print("*********${isLoading.value}****************");
    var result = await getAllDoctorUseCase();
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
        print(r);
      },
    );
  }

  Future<void> updateRating({
    required int doctorId,
    required double rating,
    required context,
  }) async {
    var result = await updateRatingUseCase(doctorId: doctorId, rating: rating);
    result.fold((l) {
      showSnakeBar(
        context: context,
        status: false,
        text: mapFailureToMessage(l),
      );
    }, (r) {});
  }

  Future<void> addFavorite({required int doctorId, required context}) async {
    var result = await addFavoriteUseCase(doctorId: doctorId);
    result.fold((l) {
      showSnakeBar(
        context: context,
        status: false,
        text: mapFailureToMessage(l),
      );
    }, (r) {});
  }
}
