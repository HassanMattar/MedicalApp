import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Widget/buildRadio.dart';

import '../Controller/MedicalDataInDoctorController.dart';

// ignore: must_be_immutable
class MedicalDataForPatientScreen extends StatelessWidget {
  MedicalDataPatientForDoctorController controller = Get.find<MedicalDataPatientForDoctorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("البيانات الطبية"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "نوع السكري",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: [
                    buildRadio(
                      value: "النوع الأول",
                      groupValue: controller.diabetesType.value,
                      onChanged: (val) {
                        controller.diabetesType.value = val!;
                      },
                    ),
                    buildRadio(
                      value: "النوع الثاني",
                      groupValue: controller.diabetesType.value,
                      onChanged: (val) {
                        controller.diabetesType.value = val!;
                      },
                    ),
                    buildRadio(
                      value: "سكري الحمل",
                      groupValue: controller.diabetesType.value,
                      onChanged: (val) {
                        controller.diabetesType.value = val!;
                      },
                    ),
                    buildRadio(
                      value: "لا أعرف",
                      groupValue: controller.diabetesType.value,
                      onChanged: (val) {
                        controller.diabetesType.value = val!;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "اشرح للطبيب حالتك الصحية",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: controller.descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "اشرح للطبيب حالتك أو استفسارك باختصار",
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "مرفقات",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),

                        child: Obx(
                          () => Column(
                            children: List.generate(
                              controller.files.length,
                              (index) {
                                final file =  controller.files[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.red,
                                    ),
                                    title: Text(file.name),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.download,
          
                                        
                                      ), onPressed: () {
                                                 
                                      },
                                   
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(height: 20),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
