// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';

import 'package:medical2/features/Auth/domain/usecases/LoginUseCase.dart';

import '../../../../../Core/Routing/Routing.dart';

class LoginController extends GetxController {
  RxBool visible = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController gmail = TextEditingController();
  TextEditingController password = TextEditingController();
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});
  Future<void> login({required isDoctor, required context}) async {
    isLoading.value = true;

    final result = await loginUseCase(
      email: gmail.text,
      password: password.text,
      isDoctor: isDoctor
    );
    result.fold(
      (l) {
        showSnakeBar(
          status: false,
          text: mapFailureToMessage(l),
          context: context,
        );
        isLoading.value = false;
      },
      (r) {
        print(r);
        isDoctor
            ? Get.offAllNamed(Routes.mainDoctor)
            : Get.offAllNamed(Routes.mainPatient);
      },
    );
  }
}
