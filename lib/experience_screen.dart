import 'package:flutter/material.dart';
import 'package:portofolio/constant.dart';

class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({super.key});

  final List<String> experiences = [
    "عضو في فريق البرمجة - Al-Dandashi Group",
    "عضو في فريق IT - Educational Gate",
    "Internship - UNDP/SANAD Youth Team",
    "Internship - Syria Hackathon Startup",
    "Internship - Nahdah Tec",
    "Founder - Coach Startup"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            border: TableBorder.all(color: Colors.white24),
            columns: const [
              DataColumn(
                label: Text(
                  "الخبرة العملية",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: experiences.map((exp) {
              return DataRow(
                cells: [
                  DataCell(Text(
                    exp,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
