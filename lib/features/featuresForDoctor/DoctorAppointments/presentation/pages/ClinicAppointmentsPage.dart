import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../../../Core/Routing/Routing.dart';
import '../Controller/AppointmentController.dart';
import '../widgets/AppointmentCard.dart';
import '../widgets/dateSlider.dart';

// ignore: must_be_immutable
class ClinicAppointmentsPage extends StatelessWidget {
  AppointmentController controller = Get.find<AppointmentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "مواعيد العيادة ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            dateSlider(),
            const SizedBox(height: 12),
            Text(
              "قائمة الإنتظار",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                bool isEmpty = controller.appointmentRequired.length == 0;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD9D9D9),
                  ),
                  child: controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : !isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.appointmentRequired.length,
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                context: context,
                                appointment:
                                    controller.appointmentRequired[index],
                              );
                            },
                          ),
                        )
                      : Center(child: Text("لايوجد بيانات ليتم عرضها ")),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Directionality(
        textDirection: TextDirection.ltr,
        child: SpeedDial(
          gradientBoxShape: BoxShape.circle,
          icon: Icons.add,
          activeIcon: Icons.close,
          overlayOpacity: 0.3,
          direction: SpeedDialDirection.up,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 180, 200, 226).withValues(alpha: 178),
              Color.fromARGB(255, 158, 197, 252).withValues(alpha: 178),
              Color.fromARGB(255, 81, 139, 221).withValues(alpha: 178),
              Color.fromARGB(255, 13, 44, 112).withValues(alpha: 178),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          childrenButtonSize: Size(220, 220),
          children: [
            SpeedDialChild(
              label: 'مريض جديد',
              backgroundColor: Colors.blue,
              labelStyle: const TextStyle(color: Colors.white),
              labelBackgroundColor: Colors.blue,
              onTap: () {},
            ),
            SpeedDialChild(
              label: 'مراجعة جديدة',
              backgroundColor: Colors.blue,
              labelStyle: const TextStyle(color: Colors.white),
              labelBackgroundColor: Colors.blue,
              onTap: () {
                Get.toNamed(Routes.addNewAppointment);
              },
            ),
          ],
        ),
      ),
    );
  }
}
