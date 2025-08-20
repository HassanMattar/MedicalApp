// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/featureForPatient/SugarMuserment/domain/usecases/AddSugarMuserUseCase.dart';

import '../../../../../Core/constant.dart';

class SugarMeasurementController extends GetxController {
  AddSugarMuserUseCase addSugarMuserUseCase;
  RxString selectedType = 'صائم'.obs;
  final TextEditingController sugarMeasureController = TextEditingController();
  Rx<DateTime> selectedDate = today.obs;
  Rx<TimeOfDay> selectedTime = timeNow.obs;
  SugarMeasurementController({required this.addSugarMuserUseCase});
  final List<String> types = ['صائم', 'فاطر', 'عشوائي'];

  void pickDate(context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: const Locale('ar'),
    );
    if (date != null) (() => selectedDate.value = date);
  }

  void pickTime(context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (time != null) (() => selectedTime.value = time);
  }

  void onSubmit(context) async {
 await addSugarMuserUseCase(
      type: selectedType.value,
      date: getStringFromDate(selectedDate.value),
      time: selectedTime.value.format(context),
    );
  }
}
