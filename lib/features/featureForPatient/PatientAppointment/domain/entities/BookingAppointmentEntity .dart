class BookingAppointmentEntity {
   String appointmentDate;
   String appointmentTime;
  final int doctor;
  final String notes;
  final String patientName;
  final String patientEmail;
  final String patientPhone;

  BookingAppointmentEntity({
    required this.appointmentDate,
    required this.appointmentTime,
    required this.doctor,
    required this.notes,
    required this.patientName,
    required this.patientEmail,
    required this.patientPhone,
  });
}
