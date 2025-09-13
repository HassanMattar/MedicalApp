import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/AppointmentEntity%20.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required int id,
    required String doctorName,
    required String doctorSpecialty,
    required String appointmentDate,
    required String appointmentTime,
    required String status,
    required String statusDisplay,
  }) : super(
          id: id,
          doctorName: doctorName,
          doctorSpecialty: doctorSpecialty,
          appointmentDate: appointmentDate,
          appointmentTime: appointmentTime,
          status: status,
          statusDisplay: statusDisplay,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] as int,
      doctorName: json['doctor_name'] ?? '',
      doctorSpecialty: json['doctor_specialty'] ?? '',
      appointmentDate: json['appointment_date'] ?? '',
      appointmentTime: json['appointment_time'] ?? '',
      status: json['status'] ?? '',
      statusDisplay: json['status_display'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_name': doctorName,
      'doctor_specialty': doctorSpecialty,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
      'status': status,
      'status_display': statusDisplay,
    };
  }

  /// Parse list of appointments
  static List<AppointmentModel> listFromJson(List<dynamic> list) {
    return list.map((item) => AppointmentModel.fromJson(item)).toList();
  }
}

