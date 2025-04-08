import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mentor_planner/view/shared/styles.dart';
import 'package:mentor_planner/view/shared/text_style_helpers.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {

  final List<BarChartGroupData> chartData = [
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(toY: 8, color: const Color.fromARGB(255, 177, 198, 233).withOpacity(.8), borderRadius: BorderRadius.zero),
        BarChartRodData(toY: 5.5, color: const Color.fromARGB(255, 115, 145, 192), borderRadius: BorderRadius.zero),
        BarChartRodData(toY: 27, color: const Color.fromARGB(255, 7, 97, 170), borderRadius: BorderRadius.zero),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(toY: 27, color: const Color.fromARGB(255, 177, 198, 233).withOpacity(.8), borderRadius: BorderRadius.zero),
        BarChartRodData(toY: 45, color: const Color.fromARGB(255, 115, 145, 192), borderRadius: BorderRadius.zero),
        BarChartRodData(toY: 45, color: const Color.fromARGB(255, 7, 97, 170), borderRadius: BorderRadius.zero),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(toY: 65, color: const Color.fromARGB(255, 177, 198, 233).withOpacity(.8), borderRadius: BorderRadius.zero),
        BarChartRodData(toY: 28, color: const Color.fromARGB(255, 115, 145, 192), borderRadius: BorderRadius.zero),
        BarChartRodData(toY: 64, color: const Color.fromARGB(255, 7, 97, 170), borderRadius: BorderRadius.zero),
      ],
    ),
  ];


    return  Container(
                color: Colors.white,
          child: Padding(
            padding: defaultPadding10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 42, 86, 122),
                              ], begin: Alignment.topCenter, end: Alignment.bottomCenter, transform: GradientRotation(pi / 65))),
                        ),
                        horizontalSpacing10,
                        Text(
                          'Planned Programs',
                          style: fontFamilyMedium.size14,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(.2), borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: defaultPadding4 + leftPadding4 + rightPadding4,
                        child: Row(
                          children: [
                            Text(
                              'Month',
                              style: fontFamilyLight.size10,
                            ),
                            Icon(Icons.keyboard_arrow_down,size: 17,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpacing8,
                horizontalDivider1,
                verticalSpacing10,
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  child: BarChart(BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 70,
                    barGroups: chartData,
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(fontSize: 10);
                            String text;
                            switch (value.toInt()) {
                              case 1:
                                text = 'Jan';
                                break;
                              case 2:
                                text = 'Feb';
                                break;
                              case 3:
                                text = 'Mar';
                                break;
            
                              default:
                                text = '';
                            }
                            return Text(text, style: style);
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value % 10 == 0) {
                              return Text('${value.toInt()}', style: TextStyle(fontSize: 10));
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 7, 97, 170)),
                        ),
                        horizontalSpacing4,
                        Text(
                          'All Programs',
                          style: fontFamilyMedium.size12,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 115, 145, 192)),
                        ),
                        horizontalSpacing4,
                        Text(
                          'Active',
                          style: fontFamilyMedium.size12,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(255, 177, 198, 233).withOpacity(.8)),
                        ),
                        horizontalSpacing4,
                        Text(
                          'Completed',
                          style: fontFamilyMedium.size12,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
;
  }
}