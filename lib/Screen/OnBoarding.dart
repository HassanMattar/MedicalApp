import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/OnBoardingController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import '../Core/constant.dart';
import '../Widget/MyElevatedButton.dart';
import '../Widget/pageView.dart';

// ignore: must_be_immutable
class OnboardingPage extends StatelessWidget {
  OnBoardingController controller = Get.put(OnBoardingController());
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: (value) {
                    controller.onPageChanged(value);
                  },
                  children: onboardingData().map((data) {
                    return buildPageBuild(
                      image: data['image'] as String,
                      title: data['title'] as String,
                      desc: data['desc'] as String?, // optional
                      widget: data['widget'] as Widget?, // optional
                      context: context,
                    );
                  }).toList(),
                ),
              ),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Color(0xff407BFF),
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MyElevatedButton(
                  controller: () {
                    if (controller.currentPage.value < 2) {
                      controller.pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      controller.submit();
                    }
                  },
                  text: "التالي",
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
