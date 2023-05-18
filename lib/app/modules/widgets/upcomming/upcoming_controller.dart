import 'dart:async';

import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/total_time.dart';
import 'package:lettutor_advanced_mobile/app/data/services/profile_service.dart';
import 'package:lettutor_advanced_mobile/app/data/services/schedule_service.dart';

import '../../../data/models/schedule/schedule.dart';
import '../../jitsi/jitsi_controller.dart';

class UpcomingController extends GetxController {
  final profileService = Get.put(ProfileService());
  final scheduleService = Get.put(ScheduleService());
  final JitsiController jitsiController =
      Get.put<JitsiController>(JitsiController());
  RxString countdown = ''.obs;
  Timer? _timer;

  Rx<TotalTime?> totalTime = Rx<TotalTime?>(null);
  Rx<Schedule?> schedule = Rx<Schedule?>(null);

  @override
  void onInit() async {
    super.onInit();
    totalTime.value = await profileService.getTotalTime();
    schedule.value = await scheduleService.getUpcomingSchedule();
    if (schedule.value != null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (schedule.value!.startPeriodTimestamp!.millisecondsSinceEpoch <=
            DateTime.now().millisecondsSinceEpoch) {
          timer.cancel();
        }
        countdown.value =
            "Starts in ${JitsiController.getUntilTime(schedule.value!.startPeriodTimestamp!)}";
      });
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
