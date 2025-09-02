import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Core/constant.dart';

class MainNavigationDoctorScreen extends StatefulWidget {
  @override
  _MainNavigationDoctorScreenState createState() =>
      _MainNavigationDoctorScreenState();
}

class _MainNavigationDoctorScreenState
    extends State<MainNavigationDoctorScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
       SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Fullscreen look
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: doctorPages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {
              
            });
          },
          selectedItemColor: Color(0xff407BFF),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'المواعيد'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'صفحتي'),
          ],
        ),
      ),
    );
  }
}
