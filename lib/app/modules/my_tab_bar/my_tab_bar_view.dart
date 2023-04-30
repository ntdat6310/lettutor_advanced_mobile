// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../course/course_view.dart';
// import '../home/home_view.dart';
// import '../schedule/schedule_view.dart';
// import '../schedule_history/schedule_history_view.dart';
// import '../teacher/teacher_view.dart';
// import 'my_tab_bar_controller.dart';
//
// class MyTabBarView extends GetView<MyTabBarController> {
//   MyTabBarView({Key? key}) : super(key: key);
//
//   MyTabBarController c = Get.put(MyTabBarController());
//
//   final List<Widget> _pages = [
//     HomeView(),
//     ScheduleHistoryView(),
//     ScheduleView(),
//     TeacherView(),
//     CourseView(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Scaffold(
//       body: _pages[c.selectedIndex.value],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         currentIndex: c.selectedIndex.value,
//         onTap: (index){
//           c.onItemTapped(index);
//         },
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Upcoming',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Teacher',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Course',
//           ),
//         ],
//       ),
//     ));
//   }
// }
