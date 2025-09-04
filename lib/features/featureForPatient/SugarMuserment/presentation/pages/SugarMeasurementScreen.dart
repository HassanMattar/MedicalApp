import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/constant.dart';
import '../../../../../Widget/ChartWidget.dart';
import '../../../../../Widget/MyElevatedButton.dart';
import '../../../../../Widget/MyTextFormField.dart';
import '../Controller/SugarMeasurementController.dart';

// ignore: must_be_immutable
class SugarMeasurementScreen extends StatelessWidget {
  SugarMeasurementController controller =
      Get.find<SugarMeasurementController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "قياس السكر ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                color: Color(0xffEAEAEA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("أملأ البيانات بالشكل الصحيح"),

                      DropdownButtonFormField<String>(
                        value: controller.selectedType.value,
                        alignment: Alignment.center,
                        items: controller.types
                            .map(
                              (type) => DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              ),
                            )
                            .toList(),
                        onChanged: (val) =>
                            (() => controller.selectedType.value = val!),
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                        validator: (value)=>validatorMethod(value),
                        controller: controller.sugarMeasureController,
                        textInputType: TextInputType.number,
                        hintText: 'مستوى السكر (mg/dl)',
                        prefixIcon: Icon(Icons.data_array),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () => controller.pickDate(context),
                              icon: Icon(
                                Icons.date_range,
                                color: Color(0xff407BFF),
                              ),
                              label: Text(
                              getStringFromDate(controller.selectedDate.value),
                                style: TextStyle(color: Color(0xff407BFF)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton.icon(
                            
                              onPressed: () => controller.pickTime(context),
                              icon: Icon(
                                Icons.access_time,
                                color: Color(0xff407BFF),
                              ),
                              label: Text(
                                controller.selectedTime.value.format(context),
                                style: TextStyle(color: Color(0xff407BFF)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                  controller.isLoading.value?CircularProgressIndicator():
                      MyElevatedButton(
                        controller: () {
                          controller.onSubmit(context);
                        },
                        text: 'تسجيل',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'الرسم البياني',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(height: 120, child: buildBarChart(chartData)),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.notifications_active),
                label: Text('تنشيط التنبيهات'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff407BFF),
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
