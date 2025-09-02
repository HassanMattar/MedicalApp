// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

import '../pages/Patient_DoctorProfileScreen.dart';
import '../../../../Auth/domain/entities/DoctorEntity.dart';
import '../../../../../Widget/StartRating.dart';

// ignore: must_be_immutable
class DoctorCard_DoctorScreen extends StatelessWidget {
  DoctorEntity doctor;
  final void Function(double rating) onRating;
    final void Function() onFavorite;

  DoctorCard_DoctorScreen({
    Key? key,
    required this.doctor,
    required this.onRating,
    required this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: () {
          Get.to(Patient_DoctorProfileScreen(doctor:doctor ,));
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.red),
                      onPressed:onFavorite,
                    ),
                    SizedBox(width: 8),
                    StarsRating(
                        doctorRating:!doctor.averageRating.isEmpty? int.parse(doctor.averageRating)*0.1:0,
                        onRating: onRating),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(doctor.username,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "مفتوح الان",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 18),
                          SizedBox(width: 4),
                          Text(
                            doctor.address??"",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.call, size: 18),
                          SizedBox(width: 4),
                          Text(
                            '${doctor.phoneNumber}',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.star_outline, size: 18),
                          SizedBox(width: 4),
                          Text(
                            '${doctor.averageRating}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
