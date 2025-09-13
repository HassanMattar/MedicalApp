import 'package:flutter/material.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/entities/DoctorFavoriteEntity%20.dart';

class DoctorCardHomeScreen extends StatelessWidget {
  DoctorCardHomeScreen({
    required this.doctor,
    required this.favoriteChange,
    super.key,
  });

  final DoctorFavoriteEntity doctor;
  Function() favoriteChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical:2,horizontal:8),
        child: Column(
          children: [
            Row(
              children: [
               const Icon(Icons.person_outline),
               const SizedBox(width: 10),
                Expanded(
                  child: Text( doctor.fullName! ,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              
                  const SizedBox(width: 10),
                   TextButton(
                  onPressed:favoriteChange,
                  child:Text("ازالة من المفضلة",style:TextStyle(fontSize: 10)),
                ),
              ],
            ),
            const SizedBox(height:8),
            Row(
        
              children: [
                Icon(Icons.location_on_outlined),
         
                  Text(doctor.address??"",style:TextStyle(fontSize: 10)),
                      SizedBox(width: 5,),
               Icon(Icons.call,),
              Text('${doctor.phoneNumber}',style:TextStyle(fontSize: 10)),
                  SizedBox(width: 5,),
                 Icon(Icons.favorite_outline_outlined,),
              
              Text('${doctor.favoritesCount}',style:TextStyle(fontSize: 10)),
                 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
