import 'package:get/get.dart';

import '../modules/course/course_binding.dart';
import '../modules/course/course_view.dart';
import '../modules/course_detail/course_detail_binding.dart';
import '../modules/course_detail/course_detail_view.dart';
import '../modules/course_lesson/course_lesson_binding.dart';
import '../modules/course_lesson/course_lesson_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/meeting_video_conference/meeting_video_conference_binding.dart';
import '../modules/meeting_video_conference/meeting_video_conference_view.dart';
import '../modules/schedule/schedule_binding.dart';
import '../modules/schedule/schedule_view.dart';
import '../modules/schedule_history/schedule_history_binding.dart';
import '../modules/schedule_history/schedule_history_view.dart';
import '../modules/sign_in/sign_in_binding.dart';
import '../modules/sign_in/sign_in_view.dart';
import '../modules/teacher/teacher_binding.dart';
import '../modules/teacher/teacher_view.dart';
import '../modules/teacher_detail/teacher_detail_binding.dart';
import '../modules/teacher_detail/teacher_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER,
      page: () => TeacherView(),
      binding: TeacherBinding(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () => CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_LESSON,
      page: () => CourseLessonView(),
      binding: CourseLessonBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_DETAIL,
      page: () => TeacherDetailView(),
      binding: TeacherDetailBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_HISTORY,
      page: () => ScheduleHistoryView(),
      binding: ScheduleHistoryBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: _Paths.MEETING_VIDEO_CONFERENCE,
      page: () => const MeetingVideoConferenceView(),
      binding: MeetingVideoConferenceBinding(),
    ),
  ];
}
