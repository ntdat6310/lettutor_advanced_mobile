import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/upcomming/upcoming_controller.dart';

import '../../../routes/app_pages.dart';

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
          const Text(
            'Upcoming Lesson',
            style: TextStyle(color: Colors.white, fontSize: 24),
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
                  ? "${upcomingController.totalTime.value!.hours} hours "
                  : upcomingController.totalTime.value!.hours > 1
                      ? "0${upcomingController.totalTime.value!.hours} hours "
                      : upcomingController.totalTime.value!.hours == 1
                          ? "01 hour "
                          : "";
              String totalMinutes = upcomingController
                          .totalTime.value!.minutes >
                      9
                  ? "${upcomingController.totalTime.value!.minutes} minutes"
                  : upcomingController.totalTime.value!.minutes > 1
                      ? "0${upcomingController.totalTime.value!.minutes} minutes"
                      : upcomingController.totalTime.value!.minutes == 1
                          ? "01 minute"
                          : "0 minute";
              return Text(
                'Total lesson time is $totalHours$totalMinutes',
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
              children: const [
                Icon(Icons.video_collection, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Enter lesson room',
                  style: TextStyle(
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
