 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/Routing/Routing.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/Widget/MyElevatedButton.dart';
import 'ElevatedButtonShowDilouge.dart';

Card AppointmentCard(
      {required BuildContext context,
      required AppointmentRequired appointment}) {
    return Card(
      color: Color(0xffEAEAEA),
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
      title: Row(
  children: [
    Icon(Icons.person),
    SizedBox(width: 8),
    Expanded(
      child: Text(
        appointment.patientName,
        overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 15),
      ),
    ),
  
  
    Text(
      'موعد الحجز: ${appointment.time} ص',
      style: TextStyle(fontSize:7),
      overflow: TextOverflow.ellipsis,
    ),
    IconButton(
     
      icon: Icon(Icons.menu),
      color: Colors.black,
      onPressed: () {
        showOptions(context: context, patientId: 10);
      },
    ),
  ],
),
 contentPadding: EdgeInsets.all(5),
        subtitle: Container(
          height: 50,
          width: double.infinity,
          child: MyElevatedButton(
            controller: () {
              showConfirmAttendanceDialog(context, "${appointment.patientName}");
            },
            text: 'تأكيد حضور المريض',
          ),
        ),
      ),
    );
  }
  void showOptions({required BuildContext context, required int patientId}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('تعديل الموعد'),
              onTap: () {
                Get.toNamed(Routes.editAppointment);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('حذف', style: TextStyle(color: Colors.red)),
              onTap: () {
                // TODO: Confirm delete
              },
            ),
          ],
        ),
      );
    },
  );
}

  void showConfirmAttendanceDialog(BuildContext context, String patientName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'هل $patientName موجود بالفعل أو قمت بالتواصل معه لتأكيد حضوره للعيادة؟',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButtonShowDilouge(
                      onPressed: () {
                        Navigator.pop(context);
                        // Handle confirm logic
                      },
                      color: Colors.blue,
                      text: 'تأكيد الحجز',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButtonShowDilouge(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "إلغاء الحجز"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  
  
