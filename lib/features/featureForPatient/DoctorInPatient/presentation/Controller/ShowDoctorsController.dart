// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorFavoriteEntity%20.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/usecases/RemoveFavoriteUseCase.dart';

import '../../domain/usecases/GetAllFavoriteDoctorUseCase.dart';

class ShowDoctorsController extends GetxController {
  RxList<DoctorFavoriteEntity> allDoctors = <DoctorFavoriteEntity>[].obs;
  RxList<DoctorFavoriteEntity> filteredDoctors = <DoctorFavoriteEntity>[].obs;
  TextEditingController searchController = TextEditingController();
  GetAllFavoriteDoctorUseCase getAllFavoriteDoctorUseCase;
  RemoveFavoriteUseCase removeFavoriteUseCase;
  RxBool isLoading = false.obs;

  ShowDoctorsController({
   
    required this.getAllFavoriteDoctorUseCase,
    required this.removeFavoriteUseCase,
  });
  
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchText = searchController.text.trim();
    filteredDoctors.value = allDoctors
        .where((doctor) => doctor.fullName!.contains(searchText))
        .toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> removeFavorite(context, {required int ?doctorId}) async {
    var result = await removeFavoriteUseCase(doctorId: doctorId!);
    result.fold((l) {}, (r) {
      showSnakeBar(
        context: context,
        status: true,
        text: "تمت الازالة من المفضلة بنجاح",
      );
    });
  }

  Future<void> getAllFavoriteDoctor(context) async {
    isLoading.value = !isLoading.value;
    var result = await getAllFavoriteDoctorUseCase();
    result.fold(
      (l) {
        isLoading.value = !isLoading.value;
      },
      (r) {
        isLoading.value = !isLoading.value;
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrr$r");
        allDoctors.value = r;
        filteredDoctors.value = r;
      },
    );
  }
}
