import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/common/shared/styles.dart';
import 'package:mentor_planner/ui/common/shared/text_style_helpers.dart';
import 'package:mentor_planner/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProgramModeMatricsPieChart extends StatelessWidget {
  const ProgramModeMatricsPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          color: appwhite1,
          width: MediaQuery.of(context).size.width,
          height: 300,
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
                        Row(
                          children: [
                            Text(
                              'Program Mode metrics',
                              style: fontFamilyMedium.size14,
                            ),
                            horizontalSpacing8,
                            const Icon(
                              Icons.open_in_new,
                              size: 17,
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(.2), borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: defaultPadding4 + leftPadding4 + rightPadding4,
                        child:  Row(
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
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        PieChartData(
                          centerSpaceRadius: 75,
                          sectionsSpace: 2,
                          startDegreeOffset: -60,
                          sections: [
                            PieChartSectionData(
                              color: Color.fromARGB(255, 115, 145, 192).withOpacity(.5),
                              value: viewModel.physical,
                              title: '',
                              radius: 30,
                            ),
                            PieChartSectionData(
                              color: const Color.fromARGB(255, 15, 73, 174),
                              value: viewModel.virtual,
                              title: '',
                              radius: 30,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total Programs',
                            style: fontFamilyMedium.size14,
                          ),
                          Text(
                            "${viewModel.totalMode}",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpacing10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 15, 73, 174),
                          ),
                        ),
                        horizontalSpacing10,
                        Text(
                          'Virtula  ${viewModel.virtual}'.replaceAll('.0', ''),
                          style: fontFamilyMedium.size12,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 115, 145, 192).withOpacity(.5)),
                        ),
                        horizontalSpacing10,
                        Text(
                          'Physical  ${viewModel.physical}'.replaceAll('.0', ''),
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
      },
    );
  }
}
