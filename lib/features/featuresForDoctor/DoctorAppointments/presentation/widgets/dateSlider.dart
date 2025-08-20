
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/constant.dart';
import '../Controller/AppointmentController.dart';

class dateSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      AppointmentController controller = Get.find<AppointmentController>()..getAppointment(context);
    return Row(
      children: [
        Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ...List.generate(controller.days.length, (index) {
                final date = controller.days[index];
              
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        weekdays[date.weekday - 1 % 7],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Obx(() => InkWell(
                                                onTap: () {
                                                   controller.selectedIndex.value = index;
                                                   controller. getAppointment(context); 
                                                },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color:  (index ==controller.selectedIndex.value)
                                                      ? Color(0xff407BFF)
                                                      : Colors.grey.shade200,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  '${date.day}',
                                                  style: TextStyle(
                                                    color:  (index ==controller.selectedIndex.value)
                                                        ? Color.fromARGB(255, 3, 2, 2)
                                                        : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )),
                    ],
                  ),
                );
              }),
            ]),
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 18),
      ],
    );
  }
}
