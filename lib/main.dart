import 'package:flutter/material.dart';
import 'package:portofolio/backgorund_animation.dart';
import 'home_screen.dart';
import 'skills_screen.dart';
import 'projects_screen.dart';
import 'experience_screen.dart';
import 'contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
     SkillsScreen(),
     ProjectsScreen(),
     ExperienceScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundAnimation(), // الخلفية المتحركة تصبح متاحة في كل الصفحات!
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: "المهارات"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "المشاريع"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "الخبرات"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "التواصل"),
        ],
      ),
    );
  }
}
