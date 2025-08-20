import 'package:get/get.dart';
import 'package:medical2/Binding/AppBinding.dart';
import 'package:medical2/features/Auth/presentation/pages/NewPasswordScreen.dart';
import '../../Screen/DoctorScreens/EditeAppointmentPage.dart';
import '../../Screen/DoctorScreens/MainDoctor.dart';
import '../../features/PatientDetailsInDoctor/ PatientDetails/presentation/pages/DataMedicalScreen.dart';
import '../../features/PatientDetailsInDoctor/ PatientDetails/presentation/pages/PatientProfilePage.dart';
import '../../features/PatientDetailsInDoctor/ PatientDetails/presentation/pages/personalInfo.dart';
import '../../features/featureForPatient/ PatientDetails/presentation/pages/DataMedicalScreen.dart';
import '../../features/featureForPatient/ PatientDetails/presentation/pages/MedicalHistoryPage.dart';
import '../../features/featureForPatient/ PatientDetails/presentation/pages/personalInfo.dart';
import '../../features/Auth/presentation/pages/ForgetPassword.dart';
import '../../features/Auth/presentation/pages/Login.dart';
import '../../features/Auth/presentation/pages/OTP_Screen.dart';
import '../../Screen/OnBoarding.dart';
import '../../Screen/PatientScreen/mainPage.dart';
import '../../features/Auth/presentation/pages/SecondScreenSignUP.dart';
import '../../features/Auth/presentation/pages/SignUpByGmailScreen.dart';
import '../../Screen/SplashScreen.dart';
import '../../features/featureForPatient/PatientAppointment/presentation/pages/AppointmentBookingScreen.dart';
import '../../features/featuresForDoctor/DoctorAppointments/presentation/pages/AddNewAppointmentPage.dart';
import '../../features/featuresForDoctor/DoctorDetails/presentation/pages/DoctorMyInfo.dart';
import '../../features/featuresForDoctor/DoctorDetails/presentation/pages/MyPatientList.dart';
import 'Routing.dart';

class AppPage {
  static final pages = [
    //**for Intro Page */
    GetPage(page: () => EditAppointmentPage(), name: Routes.editAppointment),
    GetPage(page: () => OnboardingPage(), name: Routes.onBoarding),
    GetPage(
      page: () => SplashScreen(),
      name: Routes.splash,
      binding: AppBinding(),
    ),

    //**for Auth Page */
    GetPage(
      name: Routes.addNewAppointment,
      page: () => AddNewAppointmentPage(),
    ),
    GetPage(name: Routes.mainDoctor, page: () => MainNavigationDoctorScreen(), ),

    GetPage(
      name: Routes.login,
      page: () {
        return LoginScreen(isDoctor: Get.arguments['isDoctor']);
      },
    ),
       GetPage(
      name: Routes.patientListPage,
      page: () {
        return  PatientListPage();
      },
    ),
   
    GetPage(
      name: Routes.mainPatient,
       
      page: () {
        return MainPatientNavigationScreen();
      },
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(isDoctor: Get.arguments['isDoctor']),
    ),
    GetPage(
      name: Routes.otp,
      page: () => OTPScreen(
        isDoctor: Get.arguments['isDoctor'],
        comeFromSignUP: Get.arguments['comeFromSignUP'],
        email: Get.arguments['email'],
      ),
    ),
    GetPage(
      name: Routes.signUP1,
      page: () => SignUpByGmailScreen(isDoctor: Get.arguments['isDoctor']),
    ),
    GetPage(
      name: Routes.signUP,
      page: () => SignUpScreen(
        isDoctor: Get.arguments['isDoctor'],
        email: Get.arguments['email'],
      ),
    ),
    GetPage(
      name: Routes.newPasswordScreen,
      page: () => NewPasswordScreen(
        isDoctor: Get.arguments['isDoctor'],
        email: Get.arguments['email'],
      ),
    ),

 //** for Patient Page */

    GetPage(page: () => PatientInfoPage(), name: Routes.patientInfoPage),
      GetPage(page: () => BookingAppointmentScreen(), name: Routes.bookingAppointmentScreen),
     GetPage(page: () => MedicalHistoryPage(), name: Routes.medicalHistoryPage),
       GetPage(page: () => MedicalDataScreen(), name: Routes.medicalDataScreen),
//* ******for Doctor pages**/
GetPage(page: () => DoctorMyInfoPage(), name: Routes.doctorMyInfoPage),
GetPage(page: () => MedicalDataForPatientScreen(), name: Routes.medicalDataForPatientScreen),
GetPage(page: () => PatientProfileForDoctorPage(), name: Routes.patientProfileForDoctorPage),
GetPage(page: () => PatientInfoInDoctorPage(), name: Routes.patientInfoInDoctorPage),



  ];
}
