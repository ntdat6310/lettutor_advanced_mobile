import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/modules/schedule/schedule_page.dart';
import 'package:lettutor_advanced_mobile/modules/schedule_history/schedule_history_page.dart';
import 'package:lettutor_advanced_mobile/modules/teacher/teacher_page.dart';

import 'course/course_page.dart';
import 'home/home_page.dart';


class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() =>
      _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ScheduleHistoryPage(),
    SchedulePage(),
    const TeacherPage(),
    CoursePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Teacher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
          ),
        ],
      ),
    );
  }
}
