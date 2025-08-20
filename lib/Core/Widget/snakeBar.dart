
import 'package:flutter/material.dart';

showSnakeBar({required context, required bool status, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            status ? Icons.check : Icons.warning_amber_rounded,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: status ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      duration: Duration(seconds: 4),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  );
}
