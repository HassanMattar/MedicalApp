import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DoctorCard.dart';
import '../../../../../Widget/MyTextFormField.dart';
import '../Controller/ShowDoctorsController.dart';

class ShowDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShowDoctorsController controller = Get.find<ShowDoctorsController>()..getAllFavoriteDoctor(context);
    return Column(
      children: [
        MyTextFormField(
          controller: controller.searchController,
          textInputType: TextInputType.name,
          hintText: 'ابحث عن طبيب...',
          prefixIcon: const Icon(Icons.search),
        ),
        Obx(() {
          bool isEmpty = controller.filteredDoctors.length == 0;
          bool isLoading = controller.isLoading.value;
      return !isLoading?      Expanded(
                      child: !isEmpty ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.filteredDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = controller.filteredDoctors[index];
                          return DoctorCardHomeScreen(
                            doctor: doctor,
                      favoriteChange: () {},
                               
                          );
                        },
                      ):  Center(child: Text("لا يوجد قائمة مفضلة لديك")) ,
                    ): Expanded(child: Center(child: CircularProgressIndicator())) ;
                   }),
      ],
    );
  }
}
