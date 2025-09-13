import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical2/Core/constant.dart';
import 'package:medical2/features/PatientDetailsInDoctor/%20PatientDetails/domain/entities/Appointment.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/AppointmentEntity%20.dart';


class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.data,
  });

  final AppointmentEntity data;

  @override
  Widget build(BuildContext context) {
   
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Name and Specialty
            Row(
              children: [
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
              Text(data.doctorName,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data.doctorSpecialty, style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 8),
                Icon(Icons.person_outline, size: 26),
              ],
            ),
            Divider(height: 16),
            // Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("حالة الحجز:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  data.statusDisplay,
                  style: TextStyle(color: AppointmentEntity.getStatusColor( data.statusDisplay)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("التوقيت: "),
                Spacer(),
                Text(convert24ToArabicTime(data.appointmentTime)),
              ],
            ),
            Row(
              children: [
                Text("تاريخ الحجز: "),
                Spacer(),
                Text(data.appointmentDate),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text("عرض تفاصيل"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
