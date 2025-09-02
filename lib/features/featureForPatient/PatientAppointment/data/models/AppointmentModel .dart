import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/AppointmentEntity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required String appointmentDate,
    required String appointmentTime,
    required int doctor,
    required String name,
    required String phoneNumber,
    required bool patient,
  }) : super(
          appointmentDate: appointmentDate,
          appointmentTime: appointmentTime,
          doctor: doctor,
          name: name,
          phoneNumber: phoneNumber,
          patient: patient,
        );

  /// JSON → Model
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentDate: json["appointment_date"] ?? "",
      appointmentTime: json["appointment_time"] ?? "",
      doctor: json["doctor"] ?? 0,
      name: json["name"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      patient: json["patient"] ?? false,
    );
  }

  /// Model → JSON
  Map<String, dynamic> toJson() {
    return {
      "appointment_date": appointmentDate,
      "appointment_time": appointmentTime,
      "doctor": doctor,
      "name": name,
      "phoneNumber": phoneNumber,
      "patient": patient,
    };
  }
}
