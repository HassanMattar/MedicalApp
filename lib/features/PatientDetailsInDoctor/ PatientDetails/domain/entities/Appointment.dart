
import 'package:flutter/material.dart';

class Appointment {
  final String doctorName;
  final String specialty;
  final String status;
  final DateTime date;
  final String time;
  final String details;
  
  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.status,
    required this.date,
    required this.time,
    required this.details,
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
