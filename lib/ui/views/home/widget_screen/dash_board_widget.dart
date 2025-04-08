import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/common/shared/styles.dart';
import 'package:mentor_planner/ui/views/home/home_viewmodel.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/bar_chart.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/planned_program.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/program_mode_matrics_pie_chart.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/program_type_matrics_pie_chart.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/top_mentor_table.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/top_program_table.dart';
import 'package:stacked/stacked.dart';

class DashBoardWidget extends ViewModelWidget<HomeViewModel> {
  const DashBoardWidget({super.key});

  @override
 Widget build(BuildContext context, HomeViewModel viewModel) {
  return Padding(
    padding: defaultPadding10,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMobile
                ? Column(
                    children: const [
                      PlannedProgram(),
                      SizedBox(height: 12),
                      MyChart(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(child: PlannedProgram()),
                      SizedBox(width: 12),
                      Expanded(child: MyChart()),
                    ],
                  ),
            verticalSpacing16,
            const TopProgramTable(),
            verticalSpacing16,
            const TopMentorTable(),
            verticalSpacing16,
            const ProgramTypeMatricsPieChart(),
            verticalSpacing16,
            const ProgramModeMatricsPieChart(),
          ],
        );
      },
    ),
  );
}

}
