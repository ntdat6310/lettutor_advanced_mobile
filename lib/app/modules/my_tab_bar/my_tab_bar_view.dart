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
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'home'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today),
                label: 'upcoming'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'teacher'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.book),
                label: 'course'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.chat_outlined),
                label: 'chat'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'setting'.tr,
              ),
            ],
          ),
        ));
  }
}
