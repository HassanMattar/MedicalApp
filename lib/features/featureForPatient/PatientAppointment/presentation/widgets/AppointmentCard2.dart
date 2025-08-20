
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical2/Core/constant.dart';
import '../../../ PatientDetails/domain/entities/Appointment.dart';

// ignore: must_be_immutable
class AppointmentCard2 extends StatelessWidget {
AppointmentCard2({
  required this.dataAppointment
});
  Appointment dataAppointment;
  @override
  Widget build(BuildContext context) {
    final dateStr = getStringFromDate(dataAppointment.date);
    final dayName = DateFormat.EEEE('ar_SA').format(dataAppointment.date); // Arabic day
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        title: Text(dateStr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Text(dayName, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
