import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/presentation/Controller/AppointmentController.dart';
import '../widgets/AppoinmentCard.dart';
import '../widgets/AppointmentCard2.dart';

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppointmentsController controller = Get.find<AppointmentsController>()
      ..getPreviousAppointments(context)
      ..getUpcomingAppointments(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Text(
            "مواعيدي",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        TabBar(
          unselectedLabelColor: Colors.grey,
          controller: controller.tabController,
          indicatorColor: const Color.fromARGB(255, 18, 102, 172),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: 8),

          labelColor: Colors.black,

          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          tabs: [
            Tab(text: "التالية"),
            Tab(text: "السابقة"),
          ],
        ),
        Expanded(
          child: Obx(() {
            bool isLoadingComing = controller.isLoadingComing.value;
            bool isEmptyComing =
                // ignore: invalid_use_of_protected_member
                controller.upcomingAppointment.value.length == 0;
            bool isLoadingPrevious = controller.isLoadingPrevious.value;
            bool isEmptyPrevious =
                // ignore: invalid_use_of_protected_member
                controller.previousAppointment.value.length == 0;

            return TabBarView(
              physics: BouncingScrollPhysics(),

              controller: controller.tabController,
              children: [
                isLoadingComing
                    ? Center(child: CircularProgressIndicator())
                    : isEmptyComing
                    ? Center(child: Text("لايوجد بيانات لعرضها"))
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.upcomingAppointment.length,
                        itemBuilder: (context, index) => AppointmentCard(
                          data: controller.upcomingAppointment[index],
                        ),
                      ),
                isLoadingPrevious
                    ? Center(child: CircularProgressIndicator())
                    : isEmptyPrevious
                    ? Center(child: Text("لايوجد بيانات لعرضها"))
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.previousAppointment.length,
                        itemBuilder: (context, index) => AppointmentCard2(
                          dataAppointment:
                              controller.previousAppointment[index],
                        ),
                      ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
