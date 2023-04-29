import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/modules/course/course_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/home/home_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/schedule/schedule_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/schedule_history/schedule_history_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher/teacher_view.dart';


class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() =>
      _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    ScheduleHistoryView(),
    ScheduleView(),
    TeacherView(),
    CourseView(),
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
