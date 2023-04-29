import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../data/fake_data.dart';
import '../../data/models/schedule.dart';
import '../home/components/upcomming_lesson.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_search_bar.dart';
import 'components/schedule_card.dart';
import 'schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
 ScheduleView({Key? key}) : super(key: key);

  final List<Schedule> scheduleList = FakeData().getSchedules();

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSearchBar(
                      onChanged: (value) {
                        print(value);
                      },
                      searchHint: 'Enter tutor\'s name'),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(scheduleList.length,
                            (index) => ScheduleCard(schedule: scheduleList[index])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
