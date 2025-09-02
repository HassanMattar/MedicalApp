// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:medical2/features/Auth/domain/entities/DoctorEntity.dart';
import 'package:medical2/features/Auth/domain/entities/User.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/OnBoardingController.dart';

import '../features/featuresForDoctor/DoctorDetails/presentation/pages/Doctor_MyProfilePage.dart';
import '../Widget/buildRadio.dart';
import '../features/Auth/domain/entities/patientEntity.dart';
import '../features/featureForPatient/ PatientDetails/domain/entities/Appointment.dart';
import '../features/featureForPatient/ PatientDetails/presentation/pages/PatientProfilePage.dart';
import '../features/featureForPatient/DoctorInPatient/presentation/pages/DoctorScreen.dart';
import '../features/featureForPatient/DoctorInPatient/presentation/pages/HomeScreen.dart';
import '../features/featureForPatient/PatientAppointment/presentation/pages/AppointmentScreen.dart';
import '../features/featureForPatient/SugarMuserment/presentation/pages/SugarMeasurementScreen.dart';
import '../features/featuresForDoctor/DoctorAppointments/presentation/pages/ClinicAppointmentsPage.dart';

List<Map<String, dynamic>> onboardingData() => [
  {
    'image': 'images/onBording1.png',
    'title': 'معك خطوة بخطوة',
    'desc': 'تطبيقك اليومي لمتابعة قراءات السكر و التواصل مع طبيبك بكل سهولة.',
  },
  {
    'image': 'images/onBording2.png',
    'title': 'سيطر على سكرك بثقة',
    'desc':
        'راقب مستويات السكر ,سجّل بياناتك و ادويتك , واحصل على تنبيهات في الوقت المناسب.',
  },
  {
    'image': 'images/onBording3.png',
    'title': 'اختر دورك',
    'widget': UserType(),
  },
];

final List<Map<String, dynamic>> chartData = [
  {
    "type": "AD",
    "values": [100, 80, 60],
  },
  {
    "type": "AE",
    "values": [90, 110, 70],
  },
  {
    "type": "AF",
    "values": [120, 60, 90],
  },
  {
    "type": "AG",
    "values": [60, 100, 80],
  },
  {
    "type": "AL",
    "values": [130, 70, 100],
  },
  {
    "type": "AM",
    "values": [100, 90, 95],
  },
];
final DateTime today = DateTime.now();
TimeOfDay timeNow = TimeOfDay.now();
String getStringFromDate(DateTime date) {
  return DateFormat('d/M/yyyy').format(date);
}

List<DateTime> getNextSevenDays() {
  return List.generate(7, (index) => today.add(Duration(days: index)));
}

final List<Widget> patientPages = [
  PatientProfilePage(),
  DoctorsPage(),
  HomePage(),
  AppointmentsPage(),
  SugarMeasurementScreen(),
];
final List<Widget> doctorPages = [
  ClinicAppointmentsPage(),
  Doctor_MyProfilePage(),
];
final List<String> weekdays = [
  'الإثنين',
  'الثلاثاء',
  'الأربعاء',
  'الخميس',
  'الجمعة',
  'السبت',
  'الأحد',
];

// ignore: must_be_immutable
class UserType extends StatelessWidget {
  OnBoardingController controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildRadio(
            value: 'الطبيب',
            groupValue: controller.selectedRole.value,
            onChanged: (value) {
              controller.selectedRole.value = value!;

              print(controller.selectedRole.value);
            },
          ),
          buildRadio(
            value: 'المريض',
            groupValue: controller.selectedRole.value,
            onChanged: (value) {
              controller.selectedRole.value = value!;

              print(controller.selectedRole.value);
            },
          ),
        ],
      ),
    );
  }
}

List<Patient> patient = [
  Patient(
    password: 'ddd',
    address: 'gaza',
    email: ' ffddd',
    name: 'حسن',
    phoneNumber: "0567607921",
    dateOfBirth: DateTime.now().toString(),
    gender: "ذكر",
  ),
  Patient(
    address: 'gaza',
    email: ' ffddd',
    password: 'ddd',
    name: 'حسن',
    phoneNumber: "0567607921",
    dateOfBirth: DateTime.now().toString(),
    gender: "ذكر",
  ),
  Patient(
    address: 'gaza',
    password: 'ddd',
    email: ' ffddd',
    name: 'حسن',
    phoneNumber: "0567607921",
    dateOfBirth: DateTime.now().toString(),
    gender: "ذكر",
  ),
  Patient(
    address: 'gaza',
    email: ' ffddd',
    name: 'حسن',
    phoneNumber: "0567607921",
    password: 'ddd',
    dateOfBirth: DateTime.now().toString(),
    gender: "ذكر",
  ),
];

final List<User> users = [
  Patient(
    address: 'gaza',
    email: 'حسن',
    name: 'حسن',
    phoneNumber: "0567607921",

    dateOfBirth: DateTime.now().toString(),
    gender: "ذكر",
    password: 'ddd',
  ),
  Patient(
    password: 'ddd',
    address: 'gaza',
    email: ' ffddd',
    name: 'حسن',
    phoneNumber: "0567607921",
    dateOfBirth: DateTime.now().toString(),
    gender: "ذكر",
  ),
  Doctor(
    email: "حسن",
    password: "123",
    address: "غزة",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
    id: 11,
  ),
  Doctor(
    email: "حسن",
    password: "123",
    address: "غزة",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
    id: 11,
  ),
];

class AppointmentRequired {
  String patientName;
  String time;
  AppointmentRequired({
    required this.patientName,
    required this.time,
  });
}

List <AppointmentRequired>appointmentRequired = [
  AppointmentRequired(patientName:"محمود طوطح",time: "10:10"),
  AppointmentRequired(patientName:"محمود طوطح",time: "10:10"),
  AppointmentRequired(patientName:"محمود طوطح",time: "10:10"),
  AppointmentRequired(patientName:"محمود طوطح",time: "10:10"),
  AppointmentRequired(patientName:"محمود طوطح",time: "10:10"),];

  String convertDateFormat(String date) {
  final parts = date.split('/'); // [day, month, year]
  final day = parts[0];
  final month = parts[1];
  final year = parts[2];
 print("xxxxxx$year-$month-$day");
  return "$year-$month-$day"; // YYYY-MM-D
}

final List<Doctor> allDoctors = [
  Doctor(
    email: "حسن",
    password: "123",
    address: "غزة",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
    id: 11,
  ),
  Doctor(
    email: "hassan mattar",
    address: "غزة",
    phoneNumber: "0567607921",
    password: "123",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
    id: 11,
  ),
  Doctor(
    email: "hassan mattar",

    id: 11,
    address: "غزة",
    password: "123",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
  ),
  Doctor(
    password: "123",
    email: "hassan mattar",

    address: "غزة",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
    id: 11,
  ),
  Doctor(
    email: "hassan mattar",
    address: "غزة",
    phoneNumber: "0567607921",
    password: "123",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    id: 11,
    rating: 10,
  ),
  Doctor(
    password: "123",
    email: "hassan mattar",
    id: 11,
    address: "غزة",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
  ),
  Doctor(
    email: "hassan mattar",
    id: 11,
    address: "غزة",
    password: "123",
    phoneNumber: "0567607921",
    favoriteNumber: 100,
    qualification: "دكتور",
    name: 'حسن مطر',
    rating: 10,
  ),
];
List<Appointment> upcomingAppointments = [
  Appointment(
    doctorName: 'عبدالله العصــار',
    specialty: 'دكتور متخصص في أمراض السكر',
    status: 'مقبول',
    date: DateTime(2025, 6, 1),
    time: '8:15 PM',
    details: 'تفاصيل الحجز',
  ),
  Appointment(
    doctorName: 'عبدالله العصــار',
    specialty: 'دكتور متخصص في أمراض السكر',
    status: 'قيد الانتظار',
    date: DateTime(2025, 6, 5),
    time: '8:15 PM',
    details: 'تفاصيل الحجز',
  ),
];
List<Appointment> previousAppointments = [
  Appointment(
    doctorName: 'عبدالله العصــار',
    specialty: 'دكتور متخصص في أمراض السكر',
    status: 'مقبول',
    date: DateTime(2025, 6, 1),
    time: '8:15 PM',
    details: 'تفاصيل الحجز',
  ),
  Appointment(
    doctorName: 'عبدالله العصــار',
    specialty: 'دكتور متخصص في أمراض السكر',
    status: 'قيد الانتظار',
    date: DateTime(2025, 6, 5),
    time: '8:15 PM',
    details: 'تفاصيل الحجز',
  ),
];

String? validatorMethod(value) {
  if (value == null || value.isEmpty) {
    return 'هذا الحقل مطلوب';
  }

  return null;
}
