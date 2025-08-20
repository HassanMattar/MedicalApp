import 'package:flutter/material.dart';

import '../../Widget/MyElevatedButton.dart';
import '../../Widget/MyTextFormField.dart';
import '../../Widget/showBicker.dart';


class EditAppointmentPage extends StatefulWidget {
  const EditAppointmentPage({super.key});

  @override
  State<EditAppointmentPage> createState() => _EditAppointmentPageState();
}

class _EditAppointmentPageState extends State<EditAppointmentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل الموعد'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'يرجى تحديد التاريخ ووقت المراجعة الجديدة للمريض',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),
             
                MyTextFormField(
                  hintText: 'اسم المريض',
                  initialValue: 'عبدالله العصا',
                  controller: _nameController,
                ),
                const SizedBox(height: 12),
                MyTextFormField(
                  controller: _dateController,
                  hintText: "تاريخ المراجعة",
                  prefixIcon: const Icon(Icons.calendar_today),
                  initialValue: "16/12/2025",
                  onTap: () {
                    selectDate(_dateController, context);
                  },
                ),

                const SizedBox(height: 12),
                MyTextFormField(
                  controller: _dateController,
                  hintText: "وقت المراجعة",
                  prefixIcon: const Icon(Icons.access_time),
                  initialValue: "10:00",
                  onTap: () {
                    selectTime(_timeController, context);
                  },
                ),

                const SizedBox(height: 12),

                MyTextFormField(
                  hintText: 'البريد الالكترون',
                  initialValue: 'email@gmail.com',
                  controller: _emailController,
                ),

                const SizedBox(height: 12),

                MyTextFormField(
                  hintText: 'رقم الموبايل',
                  initialValue: '025889999',
                  controller: _phoneController,
                ),

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyElevatedButton(
                    controller: () {
                      if (_formKey.currentState!.validate()) {
                     
                      }
                    },
                    text: 'تعديل',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 }
