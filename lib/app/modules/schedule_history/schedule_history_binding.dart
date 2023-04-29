import 'package:get/get.dart';

import 'schedule_history_controller.dart';

class ScheduleHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleHistoryController>(
      () => ScheduleHistoryController(),
    );
  }
}
