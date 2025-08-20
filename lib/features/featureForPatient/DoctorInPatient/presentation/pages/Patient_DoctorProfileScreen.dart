// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import '../../../../../Core/Routing/Routing.dart';
import '../../../../../Widget/ClinicDetailsCard.dart';
import '../../../../../Widget/MyElevatedButton.dart';
import '../../../../../Widget/StartRating.dart';
import '../../../../Auth/domain/entities/DoctorEntity.dart';

// ignore: must_be_immutable
class Patient_DoctorProfileScreen extends StatelessWidget {
  Doctor doctor;
  Patient_DoctorProfileScreen({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
                    const Text('ملف الطبيب',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 10),
                    Text(doctor.name!,
                        style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    StarsRating(
                      doctorRating: doctor.rating??0,
                      onRating: (double rating) {},
                    ),
                    const SizedBox(height: 16),
                    Text('تفاصيل العيادة',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                 
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Directionality(
                    textDirection: TextDirection.rtl, child: ClinicDetailsCard(doctor: doctor,)),
              ),
              const SizedBox(height: 20),
              Text('المؤهلات',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Container(
                height: 80,
                child: Text(
                "${doctor.qualification}"
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:  ()async{
          await FlutterPhoneDirectCaller.callNumber(doctor.phoneNumber!);
} ,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48)),
                child: const Text("تحدث مع طبيب"),
              ),
              const SizedBox(height: 12),
              MyElevatedButton(
                controller: () {
                  Get.toNamed(Routes.bookingAppointmentScreen);
                },
              
            text:  "حجز موعد",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
