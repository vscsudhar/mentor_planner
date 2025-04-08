import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/common/shared/styles.dart';
import 'package:mentor_planner/ui/views/home/home_viewmodel.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/bar_chart.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/planned_program.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/program_type_matrics_pie_chart.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/top_mentor_table.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/top_program_table.dart';
import 'package:stacked/stacked.dart';

class DashBoardWidget extends ViewModelWidget<HomeViewModel> {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Padding(
      padding: defaultPadding10,
      child: Column(
        children: [
          Wrap(
            spacing: 16, 
            runSpacing: 16, 
            children: [
              PlannedProgram(),
              MyChart(),
            ],
          ),
          verticalSpacing16,
              TopProgramTable(),
          verticalSpacing16,
              TopMentorTable(),
          verticalSpacing16,
              ProgramTypeMatricsPieChart(),
        ],
      ),
    );
  }
}
