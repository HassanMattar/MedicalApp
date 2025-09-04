// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/MedicalData.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/AddFilesUseCase.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetFilesUseCase.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetMedicalDataUseCase.dart';

import '../../domain/usecases/UpdateMedicalDataUseCase.dart';

class MedicalDataController extends GetxController {
  RxString diabetesType = 'النوع الأول'.obs;
  TextEditingController description = TextEditingController();
  RxList selectedFiles = [].obs;
  RxList getFiles = [].obs;
  UpdateMedicalDataUseCase useCase;
  GetMedicalDataUseCase getMedicalUseCase;
  AddFilesUseCase addFileUseCase;
  GetFilesUseCase getFileUseCase;

  MedicalDataController({
    required this.useCase,
    required this.getMedicalUseCase,
    required this.addFileUseCase,
    required this.getFileUseCase,
  });
  void onInit() async {
    super.onInit();
    var result = await getFileUseCase();
    result.fold((l) {}, (r) {
      getFiles.value = r;
    });
    var result2 = await getMedicalUseCase();
   result2.fold((l) {}, (r) {
      diabetesType.value = r.diabetesType;
      description.text = r.medical_notes;
    });
  }

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

  void removeGetFile(int index) {
    getFiles.removeAt(index);
  }

  Future<void> submit(context) async {
    var resultAddFile = await addFileUseCase(
      selectedFiles: selectedFiles.value,
    );
    resultAddFile.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: mapFailureToMessage(l),
        );
      },
      (r) {
        showSnakeBar(context: context, status: true, text: "تمت رفع الملفات");
      },
    );

    var result = await useCase(
      medicalDataa: MedicalData(
        diabetesType: diabetesType.value,
        medical_notes: description.text,
      ),
    );
    result.fold(
      (l) {
        showSnakeBar(
          context: context,
          status: false,
          text: "هناك خطأ في البيانات",
        );
      },
      (r) {
        showSnakeBar(context: context, status: true, text: "تمت العملية بنجاح");
      },
    );
  }
}
