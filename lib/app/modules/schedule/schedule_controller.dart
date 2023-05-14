import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/schedule_service.dart';

import '../../data/models/schedule/schedule.dart';

class ScheduleController extends GetxController {
  final scheduleService = Get.put<ScheduleService>(ScheduleService());
  RxList<Schedule> schedules = RxList<Schedule>();
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    _initData();
  }

  void _initData() async {
    isLoading.value = true;
    schedules.value = await scheduleService.getAllSchedules();
    isLoading.value = false;
  }
}
