// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetPersonalInfoUseCase.dart';


class PatientInfoInDoctorController extends GetxController {

  GetPersonalInfoUseCase getInfoUseCase;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController barthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString gender = 'ذكر'.obs;
  PatientInfoInDoctorController({ required this.getInfoUseCase});
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


}
