// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/Core/constant.dart';

import 'package:medical2/features/featuresForDoctor/DoctorAppointments/domain/usecases/GetAppointmentUseCase.dart';

class AppointmentController extends GetxController {
  RxList appointmentRequired = [].obs;
  RxInt selectedIndex = 0.obs;
  final List<DateTime> days = getNextSevenDays();
  GetWaitingAppointmentUseCase getAppointmentUseCase;
  RxBool isLoading = false.obs;
  AppointmentController({required this.getAppointmentUseCase});

  void getAppointment(context) async {
    isLoading.value = true;
    var result = await getAppointmentUseCase(
      pageDate: days[selectedIndex.value].day,
    );
    result.fold(
      (l) {
        isLoading.value = false;
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
      },
      (r) {
        isLoading.value = false;
        appointmentRequired.value = r;
      },
    );
  }
}
