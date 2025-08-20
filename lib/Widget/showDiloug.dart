// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Routing/Routing.dart';
import 'MyElevatedButton.dart';

// ignore: must_be_immutable
class ShowSuccessDialog extends StatefulWidget {
bool isDoctor;
   ShowSuccessDialog({
    Key? key,
    required this.isDoctor,
  }) : super(key: key);
  @override
  State<ShowSuccessDialog> createState() => ShowSuccessDialogState();
}

class ShowSuccessDialogState extends State<ShowSuccessDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scale = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(color: Colors.black.withOpacity(0)),
        ),
        Center(
          child: ScaleTransition(
            scale: _scale,
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Icon(Icons.check_circle, color: Colors.blue, size: 70),
                  SizedBox(height: 16),
                  Text(
                    "تم تغيير كلمة السر بنجاح",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  MyElevatedButton(
                    controller: () {
                      Get.toNamed(Routes.login, arguments: {
                              'isDoctor': widget.isDoctor,
                            });
                    },
                    text: "استمرار",
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
