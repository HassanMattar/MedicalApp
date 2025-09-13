
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/BookingAppointmentEntity%20.dart';

class BookingAppointmentModel extends BookingAppointmentEntity {
  BookingAppointmentModel({
    required super.appointmentDate,
    required super.appointmentTime,
    required super.doctor,
    required super.notes,
    required super.patientName,
    required super.patientEmail,
    required super.patientPhone,
  });

  factory BookingAppointmentModel.fromJson(Map<String, dynamic> json) {
    return BookingAppointmentModel(
      appointmentDate: json["appointment_date"] ?? "",
      appointmentTime: json["appointment_time"] ?? "",
      doctor: json["doctor"] ?? 0,
      notes: json["notes"] ?? "",
      patientName: json["patient_name"] ?? "",
      patientEmail: json["patient_email"] ?? "",
      patientPhone: json["patient_phone"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "appointment_date": appointmentDate,
      "appointment_time": appointmentTime,
      "doctor": doctor,
      "notes": notes,
      "patient_name": patientName,
      "patient_email": patientEmail,
      "patient_phone": patientPhone,
    };
  }
}
