import 'package:flutter/material.dart';
import 'package:medical2/features/Auth/domain/entities/DoctorEntity.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

// ignore: must_be_immutable
class ClinicDetailsCard extends StatelessWidget {
   ClinicDetailsCard({super.key,required this.doctor});

  DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "مفتوح الآن",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Work hours
            const Text(
              "ساعات العمل",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "من الساعة الثامنة صباحاً حتى الساعة الثانية ظهراً",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            // Info rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(
                  child: InfoItem(
                    title: doctor.username,
                    value: "email@gmail.com",
                  ),
                ),
                Expanded(
                  child: InfoItem(title: "العنوان", value: doctor.address!,),
                ),
              ],
            ),
            const SizedBox(height: 12),
             InfoItem(title: "رقم التلفون", value: doctor.phoneNumber!),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
