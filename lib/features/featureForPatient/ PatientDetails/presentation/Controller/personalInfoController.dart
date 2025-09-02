
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/patientProfileEntity.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetPersonalInfoUseCase.dart';

import '../../domain/usecases/UpdatePersonalInformationUseCase.dart';

class PatientInfoController extends GetxController {
  UpdatePersonalInformationUseCase useCase;
  GetPersonalInfoUseCase getInfoUseCase;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController barthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString gender = 'ذكر'.obs;
  PatientInfoController({required this.useCase, required this.getInfoUseCase});
  final List<String> genderOptions = ['ذكر', 'أنثى'];

  @override
  void onInit() async {
    print(fullNameController.text);
    super.onInit();
    
    var result = await getInfoUseCase();
    result.fold((l) {}, (r) {
      fullNameController.text = "";
      addressController.text = r.address ?? "";
      barthDateController.text = r.dateOfBirth ?? "";
      phoneNumberController.text = r.phoneNumber ?? "";
      gender.value = r.gender ?? "ذكر";
      emailController.text ="";
    });
  }

  Future<void> submit(context) async {
    var result = await useCase(
      patient: PatientProfileEntity(fullName: fullNameController.text, email: emailController.text,address:addressController.text,
      dateOfBirth:  barthDateController.text,
      phoneNumber:phoneNumberController.text, 
      gender: gender.value,  ),
    );

    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
      },
      (r) {
        showSnakeBar(
          context: context,
          status: true,
          text: "تم حفظ البيانات بنجاح",
        );
      },
    );
  }
}
