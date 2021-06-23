import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class graphic extends StatefulWidget {
  @override
  _graphicState createState() => _graphicState();
}

class _graphicState extends State<graphic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BarChart(BarChartData(
                    maxY: 9,
                    groupsSpace: 10, barGroups: [
                  BarChartGroupData(x: 1,barRods: [
                    BarChartRodData(
                        y: 7,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(
                        y: 8,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(
                        y: 4,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(
                        y: 5,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 5, barRods: [
                    BarChartRodData(
                        y: 4,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 6, barRods: [
                    BarChartRodData(
                        y: 6,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 6, barRods: [
                    BarChartRodData(
                        y: 7,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ]),
                  BarChartGroupData(x: 6, barRods: [
                    BarChartRodData(
                        y: 6,
                        colors: [Colors.red, Colors.blue],
                        width: 3,
                        borderRadius: BorderRadius.circular(3))
                  ])
                ])),
              ),
            ),
            Text("1:Aksiyon 2:Bilimkurgu 3:Fantastik 4:Gerilim \n5:Komedi 6:Korku 7:Macera 8:Animasyon"),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
