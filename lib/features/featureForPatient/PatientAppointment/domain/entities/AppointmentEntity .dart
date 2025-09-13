import 'dart:ui' show Color;

class AppointmentEntity {
  final int id;
  final String doctorName;
  final String doctorSpecialty;
  final String appointmentDate;
  final String appointmentTime;
  final String status;
  final String statusDisplay;

  const AppointmentEntity({
    required this.id,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.status,
    required this.statusDisplay,
  });
   // Optional: Convert status to color
  static getStatusColor(String status) {
    switch (status) {
      case 'مقبول':
        return const Color(0xFF2196F3); // Blue
      case 'قيد الانتظار':
        return const Color(0xFFFF9800); // Orange
      case 'مرفوض':
        return const Color(0xFFF44336); // Red
      default:
        return const Color(0xFF9E9E9E); // Grey
    }
  }
}
