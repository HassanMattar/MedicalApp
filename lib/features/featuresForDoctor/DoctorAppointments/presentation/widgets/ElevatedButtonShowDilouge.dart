import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevatedButtonShowDilouge extends StatelessWidget {
  ElevatedButtonShowDilouge({
    required this.onPressed,
    required this.text,
    required this.color,
    super.key,
  });
  Function() onPressed;
  Color color;
  String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(40),
      ),
      child: Text(text),
    );
  }
}
