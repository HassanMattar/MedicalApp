// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
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
    super.onInit();
    var result = await getInfoUseCase();
    result.fold((l) {}, (r) {
      fullNameController.text = r.name!;
      addressController.text = r.address!;
      barthDateController.text = r.dateOfBirth!;
      phoneNumberController.text = r.phoneNumber!;
      emailController.text = r.phoneNumber!;
    });
  }


  Future<void> submit(context) async {
    var result = await useCase(
      email: emailController.text,
      address: addressController.text,
      gender: gender.value,
      name: fullNameController.text,
      barth: barthDateController.text,
      tel: phoneNumberController.text,
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
