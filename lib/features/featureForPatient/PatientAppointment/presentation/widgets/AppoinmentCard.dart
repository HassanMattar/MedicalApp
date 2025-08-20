import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../ PatientDetails/domain/entities/Appointment.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.data,
  });

  final Appointment data;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd/MM/yyyy').format(data.date);
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
                    Text(data.specialty, style: TextStyle(fontSize: 12)),
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
                  data.status,
                  style: TextStyle(color: Appointment.getStatusColor( data.status)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("التوقيت: "),
                Spacer(),
                Text(data.time),
              ],
            ),
            Row(
              children: [
                Text("تاريخ الحجز: "),
                Spacer(),
                Text(date),
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
