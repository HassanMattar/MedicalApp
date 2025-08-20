
  import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> selectDate(dateController,context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Future<void> selectTime(timeController,context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dialOnly);
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }
