import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/booking_schedule/components/teacher_brief_info.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/no_data_found.dart';

import 'booking_schedule_controller.dart';
import 'components/daily_schedule_booking_widget.dart';

class BookingScheduleView extends GetView<BookingScheduleController> {
  const BookingScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('booking_schedule'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              TeacherBriefInfo(teacher: controller.teacher),
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator(
                      color: Colors.blueAccent);
                }
                if (controller.dailyScheduleBookings.isEmpty) {
                  return const NoDataFound();
                }
                return Column(
                  children: List.generate(
                      controller.dailyScheduleBookings.length, (index) {
                    return DailyBookingScheduleWidget(
                      dailyScheduleBooking:
                          controller.dailyScheduleBookings[index],
                      onTap: controller.showBookAScheduleDialog,
                    );
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
