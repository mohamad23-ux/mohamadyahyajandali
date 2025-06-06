import 'package:flutter/material.dart';
import 'package:portofolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
   ProjectsScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> projects = [
    {"name": "MYM - CRUD API Laravel", "url": "https://github.com/mohamad23-ux/MYM"},
    {"name": "Firebase Auth & CRUD", "url": "https://github.com/mohamad23-ux/FirebaseAuthCRUD"},
    {"name": "Noty - Notes & Lectures App", "url": "https://github.com/mohamad23-ux/Noty"},
    {"name": "Weather App - API Training", "url": "https://github.com/mohamad23-ux/WeatherApp"},
    {"name": "Bookly App - Google API", "url": "https://github.com/mohamad23-ux/Bookly"},
    {"name": "Hive Notes App", "url": "https://github.com/mohamad23-ux/HiveNotes"}
  ];

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "لا يمكن فتح الرابط: $url";
    }
  }

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
                  "اسم المشروع",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "رابط المشروع",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: projects.map((project) {
              return DataRow(cells: [
                DataCell(Text(
                  project["name"]!,
                  style: const TextStyle(color: Colors.white),
                )),
                DataCell(ElevatedButton(
                  onPressed: () => _launchURL(project["url"]!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentColor,
                  ),
                  child: const Text(
                    "زيارة المشروع",
                    style: TextStyle(color: Colors.black),
                  ),
                )),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
