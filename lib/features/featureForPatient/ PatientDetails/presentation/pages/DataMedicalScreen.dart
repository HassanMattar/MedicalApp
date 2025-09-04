import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/Widget/MyElevatedButton.dart';
import 'package:medical2/Widget/buildRadio.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/FileEntity.dart';

import '../Controller/MedicalDataController.dart';

// ignore: must_be_immutable
class MedicalDataScreen extends StatelessWidget {
  MedicalDataController controller = Get.find<MedicalDataController>();
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
                Obx(
                ()=>
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
                )
                ,
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
                    controller: controller.description,
                    validator:(value)=> validatorMethod(value),
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

                        child: Obx(() {
                          return Column(
                            children: [
                               Column(
                                 children: List.generate(
                                  controller.getFiles.length,
                                  (index) {
                                    FileEntity file = controller.getFiles[index];
                                    List url =file.fileUrl.split("/");
                                    String fileName =url[url.length-1];
                                    return Card(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        ),
                                        title: Text(fileName),
                                        trailing: IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () =>
                                              controller.removeGetFile(index),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                 children: List.generate(
                                  controller.selectedFiles.length,
                                  (index) {
                                    final file = controller.selectedFiles[index];
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
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () =>
                                              controller.removeFile(index),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: controller.pickFiles,
                  child: Center(
                    child: DottedBorder(
                      options: RectDottedBorderOptions(
                        borderPadding: EdgeInsets.all(-10),
                      ),
                      child: Text(
                        "إضافة مرفقات",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyElevatedButton(
                    controller: () {
                      controller.submit(context);
                    },
                    text: "حفظ",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
