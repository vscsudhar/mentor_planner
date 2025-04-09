import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_planner/view/screens/dash_board_widget.dart';
import 'package:mentor_planner/view/screens/program_widget.dart';
import 'package:mentor_planner/view/screens/widgets/right_side_drawer.dart';
import 'package:mentor_planner/view/shared/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundIconColor,
      appBar: AppBar(
        backgroundColor: appwhite1,
        leading: Padding(
          padding: defaultPadding8 + leftPadding8,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: selectedColorItem,
            ),
            child: const Padding(
              padding: defaultPadding3,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/7eda/76b9/148577323408b43e8a1f622abc9c02e5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=CNUuejzmmtNV9vnuANF2Wzuq5-jl-osYiGwJUsOVOk-EClw8Ye55-EpZFiBca~~X6ONCiND9aQjSGP~NaMMxdEre0xU73zEnIsspaMonPAaCELlYjbYT1LRzUdYZ3tKNDJuHomt4uF4kHVqnS8W8KV6sj7rcBJVmRvLKpffL6CbUxWp48If0TGquQR9xTaGtDMCnb0bDY-Ho4LwDGBVWozsgHE79ycnujQU9CL~7Gg1TWBmzNRjtcdzWwE90JbC7JsBkjgCzcgfZEiWZCktaPSdaXrUDgMO~eIKIYNMKpZ3gYZmTWal9FPCSH3zAtyVY4IYz1848OnoydeEaW3OUmw__'),
                // child: Icon(Icons.person),
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
                  icon: const Icon(
                    CupertinoIcons.search,
                    color: Color(0xfff00aebd),
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
                    Icons.notifications,
                    color: Color(0xfff00aebd),
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
                    child: const Icon(Icons.menu, size: 16,color: Color(0xfff00aebd),),
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
                _currentIndex == 0 ?
                DashBoardWidget():
                ProgramsWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _onTabTapped(value);
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
}