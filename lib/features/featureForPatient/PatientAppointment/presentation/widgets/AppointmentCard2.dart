import 'package:flutter/material.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/BookingAppointmentEntity%20.dart';


// ignore: must_be_immutable
class AppointmentCard2 extends StatelessWidget {
  AppointmentCard2({required this.dataAppointment});
  BookingAppointmentEntity dataAppointment;
  @override
  Widget build(BuildContext context) {
    final dateStr = dataAppointment.appointmentDate;
    final dayName = dataAppointment.appointmentDate.split("-")[0];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        title: Text(
          dateStr,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Text(dayName, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
