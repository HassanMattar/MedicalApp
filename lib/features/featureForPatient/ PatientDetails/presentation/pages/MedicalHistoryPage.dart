import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../PatientAppointment/presentation/widgets/AppointmentCard2.dart';
import '../Controller/MedicalHistoryController.dart';

// ignore: must_be_immutable
class MedicalHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      MedicalHistoryController controller = Get.find<MedicalHistoryController>() ..getAppointment(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Text(
                "السيرة المرضية ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            Expanded(
              child: Obx(() {
          bool isLoading =!controller.isLoading.value;
          bool isEmpty =   controller.appointmentList.length == 0;

                return 
                  isLoading  ? isEmpty  ? Center(
                        child: Text("ليس هناك بيانات ليتم عرضها "),
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount:  controller.appointmentList.length,
                        itemBuilder: (context, index) {
                          return AppointmentCard2(
                            dataAppointment:
                                controller.appointmentList[index],
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
