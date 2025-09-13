// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/presentation/Controller/BookingAppointmentController.dart';

import '../../../../../Widget/MyTextFormField.dart';
import '../../../../../Widget/showBicker.dart';

// ignore: must_be_immutable
class BookingAppointmentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
int doctorId;
   BookingAppointmentScreen({
    Key? key,
    required this.doctorId,
  }) : super(key: key);
  BookingAppointmentController controller = Get.find<BookingAppointmentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حجز موعد',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "اسم المريض",

                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MyTextFormField(
                validator: validatorMethod,
                controller: controller.nameController,
                hintText: "اسم المريض",
              ),
              Text(
                "تاريخ الحجز",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MyTextFormField(
                validator: validatorMethod,
                controller: controller.dateController,
                hintText: "00/00/0000",
                prefixIcon: Icon(Icons.calendar_today_outlined),
                onTap: () {
                  selectDate(controller.dateController, context);
                },
              ),
              Text(
                "وقت الحجز",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MyTextFormField(
                validator: validatorMethod,
                controller: controller.timeController,
                hintText: "00:00",
                prefixIcon: Icon(Icons.access_time),
                onTap: () {
                  selectTime(controller.timeController, context);
                },
              ),
              Text(
                "البريد الإلكتروني",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MyTextFormField(
                controller: controller.emailController,
                hintText: "******@gmail.com",
              ),
              Text(
                "رقم التلفون",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MyTextFormField(
                validator: validatorMethod,
                controller: controller.phoneController,
                hintText: "0590000000",
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.submit(context, doctorId: doctorId,);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("حجز موعد", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
