import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/booking_schedule/booking_schedule_binding.dart';
import 'package:lettutor_advanced_mobile/app/modules/booking_schedule/booking_schedule_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/course_lesson/course_lesson_view.dart';

import '../data/models/course/course.dart';
import '../modules/become_tutor/become_tutor_binding.dart';
import '../modules/become_tutor/become_tutor_view.dart';
import '../modules/chat_with_ai/chat_with_ai_binding.dart';
import '../modules/chat_with_ai/chat_with_ai_view.dart';
import '../modules/course/course_view.dart';
import '../modules/course_detail/course_detail_binding.dart';
import '../modules/course_detail/course_detail_view.dart';
import '../modules/course_lesson/course_lesson_binding.dart';
import '../modules/forgot_password/forgot_password_binding.dart';
import '../modules/forgot_password/forgot_password_view.dart';
import '../modules/home/home_view.dart';
import '../modules/my_tab_bar/my_tab_bar_binding.dart';
import '../modules/my_tab_bar/my_tab_bar_view.dart';
import '../modules/profile_setting/profile_setting_binding.dart';
import '../modules/profile_setting/profile_setting_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/schedule/schedule_view.dart';
import '../modules/schedule_history/schedule_history_binding.dart';
import '../modules/schedule_history/schedule_history_view.dart';
import '../modules/setting/setting_binding.dart';
import '../modules/setting/setting_view.dart';
import '../modules/sign_in/sign_in_binding.dart';
import '../modules/sign_in/sign_in_view.dart';
import '../modules/teacher_detail/teacher_detail_binding.dart';
import '../modules/teacher_detail/teacher_detail_view.dart';
import '../modules/teachers/teachers_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.TEACHER,
      page: () => TeachersView(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => CourseView(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () {
        CourseDetailView courseDetail = Get.arguments;
        return courseDetail;
      },
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_LESSON,
      page: () {
        Map<String, dynamic> arguments = Get.arguments;
        Course course = arguments['course'];
        int selectedTopicIndex = arguments['selectedTopicIndex'];
        return CourseLessonView(
            course: course, selectedTopicIndex: selectedTopicIndex);
      },
      binding: CourseLessonBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_DETAIL,
      page: () => const TeacherDetailView(),
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
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MY_TAB_BAR,
      page: () => MyTabBarView(),
      binding: MyTabBarBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SETTING,
      page: () => const ProfileSettingView(),
      binding: ProfileSettingBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_WITH_AI,
      page: () => ChatWithAiView(),
      binding: ChatWithAiBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_SCHEDULE,
      page: () => const BookingScheduleView(),
      binding: BookingScheduleBinding(),
    ),
    GetPage(
      name: _Paths.BECOME_TUTOR,
      page: () => const BecomeTutorView(),
      binding: BecomeTutorBinding(),
    ),
  ];
}
