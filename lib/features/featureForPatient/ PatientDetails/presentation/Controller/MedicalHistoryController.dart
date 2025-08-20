// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetMedicalHistoryUseCase.dart';

class MedicalHistoryController extends GetxController {
  GetMedicalHistoryUseCase useCase;

  RxList appointmentList = [].obs;
  MedicalHistoryController({required this.useCase});
  RxBool isLoading = false.obs;
  void getAppointment(context) async {
    isLoading.value = true;
    final result = await useCase();
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
        isLoading.value = false;
      },
      (r) {
        appointmentList.value = r;
        isLoading.value = false;
        print("object*********************");
          print(r);
      },
    );
  }
}
