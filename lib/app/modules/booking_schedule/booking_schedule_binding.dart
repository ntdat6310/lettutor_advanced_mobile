import 'package:get/get.dart';

import '../../data/models/teacher/teacher.dart';
import 'booking_schedule_controller.dart';

class BookingScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingScheduleController>(() {
      Teacher teacher = Get.arguments;
      return BookingScheduleController(teacher: teacher);
    });
  }
}
