import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/entities/Appointment.dart';

class AppointmentModel extends Appointment {
  AppointmentModel({
    required super.doctorName,
    required super.specialty,
    required super.status,
    required super.date,
    required super.time,
    required super.details,
  });
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      doctorName: json['doctorName'] as String,
      specialty: json['specialty'] as String,
      status: json['status'] as String,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      details: json['details'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorName': doctorName,
      'specialty': specialty,
      'status': status,
      'date': date.toIso8601String(),
      'time': time,
      'details': details,
    };
  }
}
