import 'package:flutter/material.dart';
import 'package:mentor_planner/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RightSideDrawer extends StatelessWidget {
  const RightSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
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
              const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                "John Doe",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Text(
                "Administrator",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const Divider(height: 30),
              _buildTile(icon: Icons.schedule, label: "Scheduler"),
              _buildTile(icon: Icons.access_time, label: "Timesheet"),
              _buildTile(icon: Icons.forum, label: "Discussions"),
              _buildTile(icon: Icons.bar_chart, label: "Reports"),
              _buildTile(icon: Icons.feedback, label: "Feedback"),
              _buildTile(icon: Icons.card_membership, label: "Certificates"),
              _buildTile(icon: Icons.rss_feed, label: "Feed"),
              _buildTile(icon: Icons.analytics, label: "Analysis"),
            ],
          ),
        );
      },
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
