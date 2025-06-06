import 'package:flutter/material.dart';
import 'package:portofolio/constant.dart';

class SkillsScreen extends StatelessWidget {
  SkillsScreen({Key? key}) : super(key: key);

  final List<String> skills = [
    "Flutter & Dart",
    "RESTful APIs",
    "MVVM & MVC",
    "State Management (Cubit, GetX, Provider)",
    "Firebase (Auth, Notifications)",
    "UI/UX Design",
    "Clean Code & GitHub"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.black54,
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DataTable(
                border: TableBorder.all(color: Colors.white24),
                columns: const [
                  DataColumn(
                    label: Text(
                      "المهارة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
                rows: skills.map((skill) {
                  return DataRow(
                    cells: [
                      DataCell(
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onHover: (_) {},
                          child: Text(
                            skill,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
