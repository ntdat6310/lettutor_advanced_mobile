import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/upcomming/upcoming_controller.dart';

class UpcomingView extends StatelessWidget {
  UpcomingView({Key? key}) : super(key: key);
  final upcomingController = Get.put<UpcomingController>(UpcomingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'upcoming_lesson'.tr,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20),
          Obx(() {
            if (upcomingController.schedule.value != null) {
              return Text(
                "${DateFormat("EEE, dd MMM yy (HH:mm - ").format(upcomingController.schedule.value!.startPeriodTimestamp!)}${DateFormat("HH:mm)").format(upcomingController.schedule.value!.endPeriodTimestamp!)}",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          const SizedBox(height: 8),
          Obx(() {
            if (upcomingController.countdown.value.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  upcomingController.countdown.value,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
          Obx(() {
            if (upcomingController.totalTime.value != null) {
              String totalHours = upcomingController.totalTime.value!.hours > 9
                  ? "${upcomingController.totalTime.value!.hours} ${'hours'.tr} "
                  : upcomingController.totalTime.value!.hours > 1
                      ? "0${upcomingController.totalTime.value!.hours} ${'hours'.tr} "
                      : upcomingController.totalTime.value!.hours == 1
                          ? "01 ${'hour'.tr} "
                          : "";
              String totalMinutes = upcomingController
                          .totalTime.value!.minutes >
                      9
                  ? "${upcomingController.totalTime.value!.minutes} ${'minutes'.tr}"
                  : upcomingController.totalTime.value!.minutes > 1
                      ? "0${upcomingController.totalTime.value!.minutes} ${'minutes'.tr}"
                      : upcomingController.totalTime.value!.minutes == 1
                          ? "01 ${'minute'.tr}"
                          : "0 ${'minute'.tr}";
              return Text(
                '${"total_lesson_time_is".tr} $totalHours$totalMinutes',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              );
            }
            return const SizedBox.shrink();
          }),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (upcomingController.schedule.value == null) {
                return;
              }
              upcomingController.jitsiController.joinMeeting(
                schedule: upcomingController.schedule.value!,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.video_collection, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  'enter_lesson_room'.tr,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
