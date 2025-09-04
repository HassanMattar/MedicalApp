import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';

import '../Core/Routing/Routing.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.1;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Fullscreen look
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _scale = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 4), () async {
      bool isLogin = await Get.find<TokenService>().hasToken();
      print("***token : $isLogin ******");
      isLogin
          ? Get.offAndToNamed(Routes.mainPatient)
          : Get.offAndToNamed(Routes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff407BFF)),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedScale(
                duration: Duration(seconds: 5),
                scale: _scale,
                curve: Curves.bounceOut,
                child: Container(
                  child: Image(image: AssetImage('images/logo.png')),
                ),
              ),

              const Text(
                'راحة سكري',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'رفيقك اليومي لحياة صحية مع السكري',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
