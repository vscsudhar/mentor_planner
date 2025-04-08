import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mentor_planner/app/app.bottomsheets.dart';
import 'package:mentor_planner/app/app.dialogs.dart';
import 'package:mentor_planner/app/app.locator.dart';
import 'package:mentor_planner/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  int index = 0;

  double premium = 40;
  double free = 54;
  double virtual = 36;
  double physical = 50;

  double get total => premium + free;
  double get totalMode => virtual + physical;

  late Color selectedColorItem = const Color.fromARGB(255, 8, 67, 119);
  Color unSelectedColorItem = Colors.black;

  void indexValue(value) {
    index = value;
    notifyListeners();
  }

  double getResponsiveWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 600) {
      return (screenWidth - 48) / 2;
    } else {
      return screenWidth - 32;
    }
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

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

  final programList = [
    {"programName": "Leader Growth", "Category": "Engineer", "created_by": "(202)555-091", "contact": "contact@cloud.com"},
    {"programName": "Tech Mentorship", "Category": "Doctor", "created_by": "(303)555-0123", "contact": "support@cloud.com"},
    {"programName": "Career Guidence", "Category": "Artist", "created_by": "(404)555-0145", "contact": "info@tech.com"},
    {"programName": " Bussiness Skill", "Category": "Chef", "created_by": "(505)555-0167", "contact": "hello@desk.com"},
    {"programName": "Soft Skill", "Category": "Teacher", "created_by": "(606)555-0198", "contact": "team@future.com"}
  ];

  final mentorList = [
    {"mentorName": "johnKennedy", "program": "Teaching Program", "email": "johnk@gmail.com", "rating": "4.9"},
    {"mentorName": "Jenifer Smith", "program": "Teaching Program", "email": "jeny@gmail.com", "rating": "4.8"},
    {"mentorName": "Thomas Shely", "program": "Teaching Program", "email": "thomas@gmail.com", "rating": "4.7"},
    {"mentorName": "John Miller", "program": "Teaching Program", "email": "miller@gmail.com", "rating": "4.5"},
    {"mentorName": "jason Morgan", "program": "Teaching Program", "email": "json@gmail.com", "rating": "4.8"},
  ];

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
