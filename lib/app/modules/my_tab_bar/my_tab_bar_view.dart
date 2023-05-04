import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/chat_with_ai/chat_with_ai_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/setting/setting_view.dart';

import '../course/course_view.dart';
import '../home/home_view.dart';
import '../teacher/teacher_view.dart';
import 'my_tab_bar_controller.dart';

class MyTabBarView extends GetView<MyTabBarController> {
  MyTabBarView({Key? key}) : super(key: key);

  MyTabBarController c = Get.put(MyTabBarController());

  final List<Widget> _pages = [
    HomeView(),
    // ScheduleHistoryView(),
    // ScheduleView(),
    TeacherView(),
    CourseView(),
    ChatWithAiView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[c.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: c.selectedIndex.value,
            onTap: (index) {
              c.onItemTapped(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.calendar_today),
              //   label: 'Upcoming',
              // ),
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
