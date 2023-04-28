import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/teacher/teacher_binding.dart';
import '../modules/teacher/teacher_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER,
      page: () => const TeacherView(),
      binding: TeacherBinding(),
    ),
  ];
}
