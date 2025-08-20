import 'package:flutter/material.dart';

import 'ElevatedButtonShowDilouge.dart';

void showConfirmAttendanceDialog(BuildContext context, String patientName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'هل $patientName موجود بالفعل أو قمت بالتواصل معه لتأكيد حضوره للعيادة؟',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButtonShowDilouge(
                      onPressed: () {
                        Navigator.pop(context);
                        // Handle confirm logic
                      },
                      color: Colors.blue,
                      text: 'تأكيد الحجز',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButtonShowDilouge(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "إلغاء الحجز"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
