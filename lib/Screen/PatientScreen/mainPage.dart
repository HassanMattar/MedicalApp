import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Core/constant.dart'; // Make sure patientPages is defined there

class MainPatientNavigationScreen extends StatefulWidget {
  @override
  _MainPatientNavigationScreenState createState() =>
      _MainPatientNavigationScreenState();
}

class _MainPatientNavigationScreenState
    extends State<MainPatientNavigationScreen> {
  int _currentIndex = 2;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 20),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
       SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, 
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: PageView(children: patientPages,controller:_pageController ,),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white60,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xff407BFF),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ملفي'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'الأطباء'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'مواعيدي'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: 'قياس السكر'),
          ],
        ),
      ),
    );
  }
}
