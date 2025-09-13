import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/DoctorScreenController.dart';
import '../../../../../Widget/MyTextFormField.dart';
import '../widgets/DoctorCardDoctorScreen.dart';

class DoctorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DoctorScreenController controller = Get.find<DoctorScreenController>()
      ..getAllDoctor(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "الأطباء",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            MyTextFormField(
              controller: controller.searchController,
              hintText: "ابحث عن الطبيب ....",
              prefixIcon: Icon(Icons.search),
            ),

            Obx(() {
              return controller.isLoading.value
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.filteredDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = controller.filteredDoctors[index];
                          return DoctorCard_DoctorScreen(
                            doctor: doctor,
                           
                            onRating: (rating) => controller.updateRating(
                              doctorId: doctor.id,
                              rating: rating,
                              context: context,
                            ),
                          );
                        },
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
