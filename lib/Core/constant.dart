// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/OnBoardingController.dart';
import 'package:medical2/features/PatientDetailsInDoctor/%20PatientDetails/domain/entities/Appointment.dart';

import '../features/featuresForDoctor/DoctorDetails/presentation/pages/Doctor_MyProfilePage.dart';
import '../Widget/buildRadio.dart';
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

String convert24ToArabicTime(String time24) {
  final inputFormat = DateFormat("HH:mm:ss");
  final outputFormat = DateFormat("h:mma");

  final parsedTime = inputFormat.parse(time24);
  String formatted = outputFormat.format(parsedTime);

  // Replace English AM/PM with Arabic
  formatted = formatted.replaceAll("AM", "ص").replaceAll("PM", "م");
  return formatted;
}
  String convertDateFormat(String date) {
  final parts = date.split('/'); // [day, month, year]
  final day = parts[0];
  final month = parts[1];
  final year = parts[2];
 print("xxxxxx$year-$month-$day");
  return "$year-$month-$day"; // YYYY-MM-D
}
String convertArabicTimeTo24(String timeString) {
  // Normalize Arabic AM/PM to English
  timeString = timeString.replaceAll("ص", "AM").replaceAll("م", "PM");

  DateTime parsedTime;

  // Try multiple possible formats
  List<String> formats = [
    "h:mm a",    // e.g. 11:04 PM
    "h:mma",     // e.g. 11:04PM
    "HH:mm:ss",  // e.g. 23:04:00
    "HH:mm"      // e.g. 23:04
  ];

  for (var format in formats) {
    try {
      parsedTime = DateFormat(format).parseStrict(timeString);
      return DateFormat("HH:mm:ss").format(parsedTime);
    } catch (_) {}
  }

  throw FormatException("Unsupported time format: $timeString");
}List<Appointment> upcomingAppointments = [
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
