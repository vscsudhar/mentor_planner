import 'package:flutter/material.dart';
import 'package:mentor_planner/view/shared/styles.dart';

class RightSideDrawer extends StatelessWidget {
  const RightSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 20),
              const Text(
                "Admin",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
          padding: defaultPadding8 + leftPadding8,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: selectedColorItem,
            ),
            child: const Padding(
              padding: defaultPadding3,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/7eda/76b9/148577323408b43e8a1f622abc9c02e5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=CNUuejzmmtNV9vnuANF2Wzuq5-jl-osYiGwJUsOVOk-EClw8Ye55-EpZFiBca~~X6ONCiND9aQjSGP~NaMMxdEre0xU73zEnIsspaMonPAaCELlYjbYT1LRzUdYZ3tKNDJuHomt4uF4kHVqnS8W8KV6sj7rcBJVmRvLKpffL6CbUxWp48If0TGquQR9xTaGtDMCnb0bDY-Ho4LwDGBVWozsgHE79ycnujQU9CL~7Gg1TWBmzNRjtcdzWwE90JbC7JsBkjgCzcgfZEiWZCktaPSdaXrUDgMO~eIKIYNMKpZ3gYZmTWal9FPCSH3zAtyVY4IYz1848OnoydeEaW3OUmw__'),
                // child: Icon(Icons.person),
              ),
            ),
          ),
        ),
              const SizedBox(height: 10),
              const Text(
                "John Doe",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Text(
                "Mentor",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const Divider(height: 30),
              _buildTile(icon: Icons.pending_actions_outlined, label: "Scheduler"),
              _buildTile(icon: Icons.library_books_outlined, label: "Timesheet"),
              _buildTile(icon: Icons.groups_outlined, label: "Discussions"),
              _buildTile(icon: Icons.newspaper_outlined, label: "Reports"),
              _buildTile(icon: Icons.reviews_outlined, label: "Feedback"),
              _buildTile(icon: Icons.workspace_premium_sharp, label: "Certificates"),
              _buildTile(icon: Icons.library_books_outlined, label: "Feed"),
              _buildTile(icon: Icons.analytics_outlined, label: "Analysis"),
            ],
          ),
        );    
  }

  Widget _buildTile({required IconData icon, required String label}) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(label),
      onTap: () {
        // Handle tap
      },
    );

  }
}