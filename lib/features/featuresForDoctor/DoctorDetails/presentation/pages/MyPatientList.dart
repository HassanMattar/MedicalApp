import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Widget/MyElevatedButton.dart';
import 'package:medical2/Widget/MyTextFormField.dart';

import '../Controller/MyPatientListController.dart';



class PatientListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final controller = Get.find<MyPatientController>()..getAllPatient(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة المرضى", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            MyTextFormField(
          hintText: "ابحث عن المريض",
            controller:controller.searchController,
            ),
            SizedBox(height: 12),
            Expanded(
              child: Obx(() =>controller.isLoading.value?Center(child: CircularProgressIndicator()): ListView.separated(
                    itemCount: controller.filteredPatients.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final patient = controller.filteredPatients[index];
                      return Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 10),
                                Text(patient.phoneNumber!,
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Spacer(),
                                Icon(Icons.phone),
                                SizedBox(width: 8),
                                Icon(Icons.male),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Text(patient.name!,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Spacer(),
                                Icon(Icons.visibility),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(patient.address!, style: TextStyle(color: Colors.grey[700])),
                            SizedBox(height: 10),
                            MyElevatedButton(
                           controller: () {
                             
                           },
                           text: "ملف المريض ",
                            )
                          ],
                        ),
                      );
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
