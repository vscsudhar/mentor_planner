import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/common/shared/styles.dart';
import 'package:mentor_planner/ui/common/shared/text_style_helpers.dart';
import 'package:mentor_planner/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PlannedProgram extends StatelessWidget {
  const PlannedProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          height: 281,
          width: viewModel.getResponsiveWidth(context),
          color: Colors.white,
          child: Padding(
            padding: defaultPadding10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                verticalSpacing16,
                verticalSpacing8,
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent.withOpacity(.2),
                      ),
                      child: Center(
                          child: Text(
                        '327',
                        style: fontFamilyBold.size16,
                      )),
                    ),
                    horizontalSpacing16,
                    Text(
                      'Programs',
                      style: fontFamilyMedium.size14,
                    )
                  ],
                ),
                verticalSpacing16,
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent.withOpacity(.2),
                      ),
                      child: Center(
                          child: Text(
                        '120',
                        style: fontFamilyBold.size16,
                      )),
                    ),
                    horizontalSpacing16,
                    Text(
                      'Mentors',
                      style: fontFamilyMedium.size14,
                    )
                  ],
                ),
                verticalSpacing16,
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purpleAccent.withOpacity(.2),
                      ),
                      child: Center(
                          child: Text(
                        '556',
                        style: fontFamilyBold.size16,
                      )),
                    ),
                    horizontalSpacing16,
                    Text(
                      'Mentees',
                      style: fontFamilyMedium.size14,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
