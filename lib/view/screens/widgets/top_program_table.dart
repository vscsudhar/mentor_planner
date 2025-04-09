import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentor_planner/view/shared/styles.dart';
import 'package:mentor_planner/view/shared/text_style_helpers.dart';

class TopProgramTable extends StatelessWidget {
  const TopProgramTable({super.key});

  @override
  Widget build(BuildContext context) {
    final programList = [
    {"programName": "Leader Growth", "Category": "Engineer", "created_by": "(202)555-091", "contact": "contact@cloud.com"},
    {"programName": "Tech Mentorship", "Category": "Doctor", "created_by": "(303)555-0123", "contact": "support@cloud.com"},
    {"programName": "Career Guidence", "Category": "Artist", "created_by": "(404)555-0145", "contact": "info@tech.com"},
    {"programName": " Bussiness Skill", "Category": "Chef", "created_by": "(505)555-0167", "contact": "hello@desk.com"},
    {"programName": "Soft Skill", "Category": "Teacher", "created_by": "(606)555-0198", "contact": "team@future.com"}
  ];


    return  Container(
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
                        decoration: BoxDecoration(color: Color(0xffdfedff), borderRadius: BorderRadius.circular(3)),
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
                                          (states) => Color(0xffd9e4f2),
                                        ),
                                        headingRowHeight: 40,
                                        dataTextStyle: fontFamilyMedium.size12,
                                        columns: const [
                                          DataColumn(
                                            label: Text('Program Name',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                                          ),
                                          DataColumn(
                                            label: Text('Category',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                                          ),
                                          DataColumn(
                                            label: Text('Created By',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                                          ),
                                          DataColumn(
                                            label: Text('Contact',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                        rows: programList
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

  }
}