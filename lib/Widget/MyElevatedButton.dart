
import 'package:flutter/material.dart';




class   MyElevatedButton extends StatelessWidget {
 

   MyElevatedButton({
    super.key,
    required this.controller,
     required this.text,

  });
 final String text;
  final Function() controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: controller,
      style: ElevatedButton.styleFrom(
      
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Color(0xff407BFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child:
          Text( text),
    );
  }
}
