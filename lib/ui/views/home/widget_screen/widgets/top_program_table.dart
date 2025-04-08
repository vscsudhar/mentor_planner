import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/common/shared/styles.dart';
import 'package:mentor_planner/ui/common/shared/text_style_helpers.dart';
import 'package:mentor_planner/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
class TopProgramTable extends StatelessWidget {
  const TopProgramTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          color: appwhite1,
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
                                'Top Programmer',
                                style: fontFamilyMedium.size14,
                              ),
                              horizontalSpacing8,
                              const Icon(Icons.open_in_new,size: 17,)
                            ],
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(.2), borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: defaultPadding4 + leftPadding4 + rightPadding4,
                          child: Text(
                            'View All',
                            style: fontFamilyLight.size10,
                          ),
                        ),
                      )
                    ],
                  ),
                  verticalSpacing8,
                  horizontalDivider1,
                  verticalSpacing10,
                SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: DataTable(
                                        headingRowColor: MaterialStateProperty.resolveWith(
                                          (states) => Colors.blue.shade100,
                                        ),
                                        headingRowHeight: 40,
                                        dataTextStyle: fontFamilyMedium.size12,
                                        columns: const [
                                          DataColumn(
                                            label: Text('Program Name',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                          ),
                                          DataColumn(
                                            label: Text('Category',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                          ),
                                          DataColumn(
                                            label: Text('Created By',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                          ),
                                          DataColumn(
                                            label: Text('Contact',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                        rows: viewModel.programList
                                            .map(
                        (program) => DataRow(cells: [
                          DataCell(Text(program['programName']!)),
                          DataCell(Text(program['Category']!)),
                          DataCell(Text(program['created_by']!)),
                          DataCell(Text(program['contact']!)),
                        ]),
                                            )
                                            .toList(),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
