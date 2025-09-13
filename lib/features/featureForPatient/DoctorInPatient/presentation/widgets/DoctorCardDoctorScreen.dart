// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorListEntity.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/presentation/Controller/DoctorScreenController.dart';

import '../../../../../Widget/StartRating.dart';
import '../pages/Patient_DoctorProfileScreen.dart';

// ignore: must_be_immutable
class DoctorCard_DoctorScreen extends StatelessWidget {
  DoctorListEntity doctor;
  final void Function(double rating) onRating;

  DoctorCard_DoctorScreen({
    Key? key,
    required this.doctor,
    required this.onRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DoctorScreenController controller =
        Get.find<DoctorScreenController>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          Get.to(Patient_DoctorProfileScreen(doctor: doctor));
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Row(
                    children: [
                      Text(
                        doctor.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      StarsRating(
                        doctorRating: !doctor.averageRating.isEmpty
                            ? double.parse(doctor.averageRating) * 0.1
                            : 0,
                        onRating: onRating,
                      ),

                      IconButton(
                        icon: Icon(
                          color: Colors.red,
                          controller.isFavorite(doctor.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        onPressed: () async {
                          await controller.addFavorite(
                            doctorId: doctor.id,
                            context: context,
                          );
                          controller.toggleFavorite(doctor.id);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 18),
                        Text(
                          doctor.address ?? "",
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.call, size: 18),

                        Text(
                          '${doctor.phoneNumber}',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.star_outline, size: 18),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
