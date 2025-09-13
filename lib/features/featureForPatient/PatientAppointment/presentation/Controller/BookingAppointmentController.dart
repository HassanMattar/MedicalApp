// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Error/FailureToString.dart';
import 'package:medical2/Core/Widget/snakeBar.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/Appointment.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/BookingAppointmentEntity%20.dart';

import '../../domain/usecases/BookingAppointmentUseCase.dart';

class BookingAppointmentController extends GetxController {
  BookingAppointmentUseCase bookingUseCase;
  BookingAppointmentController({required this.bookingUseCase});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  void submit(context, {required int doctorId}) async {
  final appointment=  BookingAppointmentEntity(appointmentDate: dateController.text,
     appointmentTime: timeController.text,
      doctor: doctorId, notes: '',
       patientName:nameController.text,
        patientEmail:  emailController.text, patientPhone:phoneController.text,);
    var result = await bookingUseCase(
  appointment: appointment
    );
    result.fold(
      (l) => showSnakeBar(
        context: context,
        status: false,
        text: mapFailureToMessage(l),
      ),
      (r) => showSnakeBar(
        context: context,
        status: true,
        text: "تمت عملية الحجز بنجاح",
      ),
    );
  }
}
