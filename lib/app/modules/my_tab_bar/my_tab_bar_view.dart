import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/chat_with_ai/chat_with_ai_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/setting/setting_view.dart';

import '../course/course_view.dart';
import '../home/home_view.dart';
import '../schedule/schedule_view.dart';
import '../teachers/teachers_view.dart';
import 'my_tab_bar_controller.dart';

class MyTabBarView extends GetView<MyTabBarController> {
  MyTabBarView({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    HomeView(),
    ScheduleView(),
    TeachersView(),
    CourseView(),
    ChatWithAiView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.onItemTapped(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
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
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          ),
        ));
  }
}
