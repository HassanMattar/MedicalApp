import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:medical2/Binding/AppBinding.dart';
import 'package:medical2/SettingService.dart';
import 'Core/Routing/Pages.dart';
import 'Core/Routing/Routing.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await InitialSettingServices();
   emailOtpConfig();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
         title: 'تطبيق طبي',
      initialBinding: AppBinding(),
      locale: Locale('ar'), 
      initialRoute: Routes.splash,
      getPages: AppPage.pages,   

      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      supportedLocales: [
        Locale('ar'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}


void emailOtpConfig() {
  EmailOTP.config(
   appName: 'Medical App',
   otpType: OTPType.numeric,
    expiry : 100000000,
   emailTheme: EmailTheme.v6,
   appEmail: 'MedicalApp@gmail.com',
   otpLength: 4,
    );
}

Future InitialSettingServices() async {
 await Get.putAsync(
    () => SettingServices().init(),
  );
}