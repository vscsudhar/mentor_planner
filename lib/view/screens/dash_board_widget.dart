import 'package:flutter/material.dart';
import 'package:mentor_planner/view/screens/widgets/my_chart.dart';
import 'package:mentor_planner/view/screens/widgets/planned_program.dart';
import 'package:mentor_planner/view/screens/widgets/program_mode_metrics_pie_chart.dart';
import 'package:mentor_planner/view/screens/widgets/program_type_metrics_pie_chart.dart';
import 'package:mentor_planner/view/screens/widgets/top_mentor_table.dart';
import 'package:mentor_planner/view/screens/widgets/top_program_table.dart';
import 'package:mentor_planner/view/shared/styles.dart';

class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({super.key});

  @override
  State<DashBoardWidget> createState() => _DashBoardWidgetState();
}

class _DashBoardWidgetState extends State<DashBoardWidget> {
  @override
  Widget build(BuildContext context) {
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
            const ProgramTypeMetricsPieChart(),
            verticalSpacing16,
            const ProgramModeMetricsPieChart(),
          ],
        );
      },
    ),
  );

  }
}

class ProgramTypeMatricsPieChart {
  const ProgramTypeMatricsPieChart();
}