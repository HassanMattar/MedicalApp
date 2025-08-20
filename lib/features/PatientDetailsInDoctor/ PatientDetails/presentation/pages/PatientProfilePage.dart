import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Routing/Routing.dart';

import '../../../../../Widget/MyElevatedButton.dart';
import '../../../../../Widget/Widget.dart';

class PatientProfileForDoctorPage extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              const Text(
                'بيانات المريض',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              buildAvatar(),
              const SizedBox(height: 12),
              const Text(
                'اسم المريض',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),
              MyElevatedButton(
                text: 'البيانات الشخصية',
                controller: () {
                  Get.toNamed(Routes.patientInfoInDoctorPage);
                },
              ),
              const SizedBox(height: 16),
              MyElevatedButton(
                text: 'البيانات الطبية',
                controller: () {
                  
                     Get.toNamed(Routes.medicalDataForPatientScreen);
               
                },
              ),
            
            ],
          ),
        ),

        
      ),
    );
  }

 
}
