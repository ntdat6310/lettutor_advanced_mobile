import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/components/upcomming_lesson.dart';
import '../widgets/custom_appbar.dart';
import 'components/schedule_card.dart';
import 'schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  ScheduleView({Key? key}) : super(key: key);
  final scheduleController = Get.put<ScheduleController>(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Schedule',
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity, child: UpcomingLesson()),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Obx(() {
                return scheduleController.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.blueAccent,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            scheduleController.schedules.value.length,
                            (index) => ScheduleCard(
                                schedule:
                                    scheduleController.schedules.value[index])),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
