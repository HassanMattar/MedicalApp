class AppointmentEntity {
  final String appointmentDate;
  final String appointmentTime;
  final int doctor;
  final String name;
  final String phoneNumber;
  final bool patient;

  const AppointmentEntity({
    required this.appointmentDate,
    required this.appointmentTime,
    required this.doctor,
    required this.name,
    required this.phoneNumber,
    required this.patient,
  });
}
