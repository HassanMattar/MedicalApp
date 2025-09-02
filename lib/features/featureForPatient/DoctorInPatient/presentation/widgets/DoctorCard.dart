import 'package:flutter/material.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorEntiy.dart';

// ignore: must_be_immutable
class DoctorCardHomeScreen extends StatelessWidget {
  DoctorCardHomeScreen({
    required this.doctor,
    required this.favoriteChange,
    super.key,
  });

  final DoctorEntity doctor;
  Function() favoriteChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                 const Icon(Icons.person_outline),
                 const SizedBox(width: 10),
                  Expanded(
                    child: Text( doctor.username ,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                
                    const SizedBox(width: 10),
                     IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(

                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 5,),
                    Text(doctor.address??""),
                        SizedBox(width: 2,),
                 Icon(Icons.call,),
                   SizedBox(width: 5,),
                Text('${doctor.phoneNumber}'),
                  SizedBox(width: 2,),
                  Icon(Icons.star_outline, ),
                    SizedBox(width: 5,),
                   Text(doctor.averageRating),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
