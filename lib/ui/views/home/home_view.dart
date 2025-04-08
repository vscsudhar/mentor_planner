import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/common/shared/styles.dart';
import 'package:mentor_planner/ui/common/shared/text_style_helpers.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/dash_board_widget.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/programs_widget.dart';
import 'package:mentor_planner/ui/views/home/widget_screen/widgets/right_side_drawer.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: backGroundIconColor,
      appBar: AppBar(
        backgroundColor: appwhite1,
        leading: Padding(
          padding: defaultPadding8 + leftPadding8,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedColorItem,
            ),
            child: Padding(
              padding: defaultPadding3,
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: topPadding10 + rightPadding8 + bottomPadding10,
            child: Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(color: backGroundIconColor, borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.search,
                    size: 15,
                  )),
            ),
          ),
          Padding(
            padding: bottomPadding10 + rightPadding8 + topPadding10,
            child: Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(color: backGroundIconColor, borderRadius: BorderRadius.circular(5)),
              child: Stack(
                children: [
                  Center(
                      child: Icon(
                    Icons.notifications_none,
                    size: 15,
                  )), // your main notification icon
                  Positioned(
                    right: 5,
                    top: 3,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Builder(
            builder: (context) {
              return Padding(
                padding: bottomPadding10 + topPadding10 + rightPadding8,
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer(); // ✅ Safe here
                  },
                  child: Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                      color: backGroundIconColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.menu, size: 16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      endDrawer: RightSideDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: defaultPadding10,
            child: Column(
              children: [
                viewModel.index == 0 ?
                DashBoardWidget():
                ProgramsWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.index,
        onTap: (value) {
          viewModel.indexValue(value);
        },
        backgroundColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 3,
        selectedItemColor: selectedColorItem,
        unselectedItemColor: unSelectedColorItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              // CupertinoIcons.square_grid_2x2,
              Icons.dashboard_outlined,
              // color: viewModel.index == 0 ? selectedColorItem : unSelectedColorItem,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // CupertinoIcons.calendar,
              Icons.calendar_month,
              // color: viewModel.index == 1 ? selectedColorItem : unSelectedColorItem,
            ),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // CupertinoIcons.person,
              Icons.person_outlined,
              // color: viewModel.index == 2 ? selectedColorItem : unSelectedColorItem,
            ),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.doc_text,
              // Icons.document_scanner,
              // color: viewModel.index == 3 ? selectedColorItem : unSelectedColorItem,
            ),
            label: 'Requests',
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
