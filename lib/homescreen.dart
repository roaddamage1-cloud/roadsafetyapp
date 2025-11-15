
// Import your pages

import 'package:roadsafetyapp/APi/complaint.dart';

import 'report.dart';
import 'package:flutter/material.dart';
import 'package:roadsafetyapp/alert.dart';
import 'package:roadsafetyapp/feedback.dart';
import 'package:roadsafetyapp/viewcontacts.dart';
import 'package:roadsafetyapp/viewreports.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuOption> menuOptions = [
      // _MenuOption(
      //   title: "Alert",
      //   icon: Icons.notifications_active,
      //   color: const Color.fromARGB(255, 95, 64, 119),
      //   page: const Alert(),
      // ),
      _MenuOption(
        title: "Feedback",
        icon: Icons.feedback,
        color: Colors.blueAccent,
        page: const Feedbackpage(),
      ),
      _MenuOption(
        title: "View Report",
        icon: Icons.report_problem,
        color: Colors.deepOrange,
        page: const ViewReports(),
      ),
      _MenuOption(
        title: "Contacts",
        icon: Icons.contacts,
        color: Colors.teal,
        page: const ViewContacts(),
      ),
      _MenuOption(
        title: "Reports",
        icon: Icons.description,
        color: const Color.fromARGB(255, 90, 58, 96),
        page: const Report(),
      ),
       _MenuOption(
        title: "Complaints",
        icon: Icons.description,
        color: const Color.fromARGB(255, 90, 58, 96),
        page: const Complaint(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ROAD SAFETY"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 3,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: menuOptions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1, // More compact height
          ),
          itemBuilder: (context, index) {
            final item = menuOptions[index];
            return _DashboardCard(option: item);
          },
        ),
      ),
    );
  }
}

// ───────────────────────────────────────────────
// DASHBOARD CARD WIDGET (Compact)
// ───────────────────────────────────────────────
class _DashboardCard extends StatelessWidget {
  final _MenuOption option;
  const _DashboardCard({required this.option});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => option.page),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: option.color.withOpacity(0.15),
                child: Icon(option.icon, color: option.color, size: 26),
              ),
              const SizedBox(height: 10),
              Text(
                option.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ───────────────────────────────────────────────
// MENU OPTION MODEL
// ───────────────────────────────────────────────
class _MenuOption {
  final String title;
  final IconData icon;
  final Color color;
  final Widget page;

  const _MenuOption({
    required this.title,
    required this.icon,
    required this.color,
    required this.page,
  });
}
