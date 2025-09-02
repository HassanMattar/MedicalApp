import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import '../../../../../Core/Routing/Routing.dart';
import '../../../domain/usecases/SignUpUseCase.dart';
class SignUpController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
    TextEditingController password1= TextEditingController();
  TextEditingController password = TextEditingController();
  final SignUpUseCase signUpUseCase;
  RxBool visible = false.obs;
    RxBool isLoading = false.obs;
 


  SignUpController({required this.signUpUseCase});
  Future<void> SignUp({required isDoctor, required context}) async {
     isLoading.value = true;
 
    final result = await signUpUseCase(
      email: email.text,
      isDoctor: isDoctor,
      name: name.text,
      password: password.text,
    );

    result.fold(
      (l) {
         isLoading.value = false;
        showSnakeBar(
          status: false,
          text: mapFailureToMessage(l),
          context: context,
        );
      },
      (r) {
         isLoading.value = false;
         showSnakeBar(
          status: true,
          text: "تمت العملية بنجاح ",
          context: context,
        );
        Get.offAllNamed(Routes.login, arguments: {'isDoctor': isDoctor});
      },
    );
  }
}
