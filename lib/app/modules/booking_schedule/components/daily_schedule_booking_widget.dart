import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/daily_schedule_booking.dart';

import '../../../data/models/schedule/schedule_booking.dart';

class DailyBookingScheduleWidget extends StatelessWidget {
  DailyBookingScheduleWidget({
    Key? key,
    required this.dailyScheduleBooking,
    required this.onTap,
  }) : super(key: key);
  final DailyScheduleBooking dailyScheduleBooking;
  final Function({required ScheduleBooking scheduleBooking}) onTap;

  TextStyle headerStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle contentStyle = const TextStyle(fontSize: 18);

  Widget _buildScheduleItem({required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${DateFormat("HH:mm").format(dailyScheduleBooking.schedules[index].startPeriodTimestamp!)} - ${DateFormat("HH:mm").format(dailyScheduleBooking.schedules[index].endPeriodTimestamp!)}',
          style: contentStyle,
        ),
        Obx(() {
          if (dailyScheduleBooking.schedules[index].isBooked.value) {
            return SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: null,
                child: Text("booked".tr, style: contentStyle),
              ),
            );
          } else {
            return SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      onTap(
                          scheduleBooking:
                              dailyScheduleBooking.schedules[index]);
                    },
                    child: Text("book".tr)));
          }
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Text(
            DateFormat('EEE, dd/MM/y').format(dailyScheduleBooking.date),
            style: headerStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ...List.generate(dailyScheduleBooking.schedules.length, (index) {
            return _buildScheduleItem(index: index);
          }),
        ],
      ),
    );
  }
}
