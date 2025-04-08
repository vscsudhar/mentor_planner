
import 'package:flutter/material.dart';
import 'package:mentor_planner/view/shared/styles.dart';
import 'package:mentor_planner/view/shared/text_style_helpers.dart';

class ProgramsWidget extends StatelessWidget {
  const ProgramsWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          verticalSpacing60,
          verticalSpacing60,
          verticalSpacing60,
         
          const Icon(Icons.calendar_month,size: 40,),
          verticalSpacing16,
          Text(
            'Coming Soon',
            style: fontFamilyMedium.size16,
          ),
        ],
      ),
    );
  }
}
