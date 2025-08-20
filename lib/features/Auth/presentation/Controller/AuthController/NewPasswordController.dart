import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../Core/Error/FailureToString.dart';
import '../../../../../Core/Widget/snakeBar.dart';
import '../../../../../Widget/showDiloug.dart';
import '../../../domain/usecases/ChangePasswordUseCase.dart';

class NewPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  ChangePasswordUseCase changePasswordUseCase;
  NewPasswordController({required this.changePasswordUseCase});
  RxBool visible = false.obs;

  Future<void> submit({
    required context,
    required bool isDoctor,
    required String email,
  }) async {
    var result = await changePasswordUseCase(
      email: email,
      password: password.text,
    );
    result.fold(
       (l) {
        showSnakeBar(
          status: false,
          text: mapFailureToMessage(l),
          context: context,
        );
      },
      (r) => showDialog(
        context: context,
        builder: (context) {
          return ShowSuccessDialog(isDoctor: isDoctor);
        },
      ),
    );
  }
}
