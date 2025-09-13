// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:medical2/Core/Error/Failure.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/data/models/BookingAppointmentModel.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/entities/BookingAppointmentEntity%20.dart';

import '../repositories/AppointmentRepository.dart';

class BookingAppointmentUseCase {
  AppointmentRepository repository;
  BookingAppointmentUseCase({required this.repository});
  Future<Either<Failure, bool>> call({
    required BookingAppointmentEntity appointment,
  }) {
  BookingAppointmentModel appointmentModel=  BookingAppointmentModel(
      appointmentDate: appointment.appointmentDate,
      appointmentTime: appointment.appointmentTime,
      doctor: appointment.doctor,
      notes: appointment.notes,
      patientName: appointment.patientName,
      patientEmail: appointment.patientEmail,
      patientPhone: appointment.appointmentTime,
    );
    return repository.bookingAppointment(appointment: appointmentModel);
  }
}
