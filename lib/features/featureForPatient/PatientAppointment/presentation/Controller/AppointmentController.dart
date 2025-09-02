// appointments_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/usecases/GetPreviousAppointmentsUseCase.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/usecases/GetUpComingAppointmentsUseCase.dart';

class AppointmentsController extends GetxController with GetSingleTickerProviderStateMixin {
  var tabIndex = 0.obs;  
  GetPreviousAppointmentsUseCase getPreviousAppointmentsUseCase;
  GetUpComingAppointmentsUseCase getUpComingAppointmentsUseCase;
  RxBool isLoadingPrevious = false.obs;
  RxBool isLoadingComing = false.obs;
  AppointmentsController({
    required this.getPreviousAppointmentsUseCase,
    required this.getUpComingAppointmentsUseCase,
  });
  RxList upcomingAppointment = [].obs;
  RxList previousAppointment = [].obs;

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

 @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void getUpcomingAppointments(context) async {
    isLoadingComing.value = true;
    var result = await getUpComingAppointmentsUseCase();
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
        isLoadingComing.value = false;
      },
      (r) {
        upcomingAppointment.value = r;
        isLoadingComing.value = false;
      },
    );
  }

  void getPreviousAppointments(context) async {
        isLoadingPrevious.value = true;
    var result = await getPreviousAppointmentsUseCase();
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
        isLoadingPrevious.value = false;
      },
      (r) {
        previousAppointment.value = r;
         isLoadingPrevious.value = false;
      },
    );
   
  }

  void changeTab(int index) {
    tabIndex.value = index;
  }
}
