// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';

import '../../domain/usecases/UpdateMedicalDataUseCase.dart';

class MedicalDataController extends GetxController {
  RxString diabetesType = 'النوع الأول'.obs;
  TextEditingController descriptionController = TextEditingController();
  RxList selectedFiles = [].obs;
  UpdateMedicalDataUseCase useCase;
  MedicalDataController({required this.useCase});
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );
    if (result != null) {
      selectedFiles.addAll(result.files);
    }
  }

  void removeFile(int index) {
    selectedFiles.removeAt(index);
  }

  Future<void> submit(context) async {
    var result = await useCase(
      diabetesType: diabetesType.value,
      description: descriptionController.text,
      // ignore: invalid_use_of_protected_member
      selectedFiles: selectedFiles.value,
    );
    result.fold((l) {
      showSnakeBar(
        context: context,
        status: false,
        text: mapFailureToMessage(l),
      );
    }, (r) {
       showSnakeBar(
        context: context,
        status: true,
        text: "تمت العملية بنجاح",
      );
    });
  }
}
