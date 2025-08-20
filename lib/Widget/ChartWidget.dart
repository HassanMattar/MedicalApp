import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget buildBarChart(List<Map<String, dynamic>> data) {
  return BarChart(
    BarChartData(
      barGroups: data.asMap().entries.map((entry) {
      
        int x = entry.key;
        List values = List.from(entry.value['values']);
        return BarChartGroupData(
          x: x,
          barRods: values.asMap().entries.map((v) {
            return BarChartRodData(
              toY: v.value * 1.0,
              color: Colors.primaries[v.key % Colors.primaries.length],
              width: 8,
              //borderRadius: BorderRadius.circular(4),
            );
          }).toList(),
        );
      }).toList(),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              return Text(data[index]['type'],
                  style: const TextStyle(fontSize: 10));
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
    ),
  );
}
