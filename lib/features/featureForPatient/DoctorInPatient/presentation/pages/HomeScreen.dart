import 'package:flutter/material.dart';
import '../../../../../Core/constant.dart';
import '../../../../../Widget/ChartWidget.dart';
import '../widgets/ShowDoctors.dart';


class HomePage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
      
        children: [
             Center(
                      child: Text(
                        "الصفحة الرئيسية ",
                        style:
                            TextStyle(fontSize:20, fontWeight: FontWeight.bold),
                      ),
                    ),
          SizedBox(
              height: 200,
              child: buildBarChart(chartData)),
          Text("قائمة الأطباء المفضلة",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xffD9D9D9),  borderRadius: BorderRadius.circular(20),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: ShowDoctors(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
