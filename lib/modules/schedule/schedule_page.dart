import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/modules/home/components/upcomming_lesson.dart';
import 'package:lettutor_advanced_mobile/modules/schedule/components/schedule_card.dart';
import 'package:lettutor_advanced_mobile/modules/widgets/custom_appbar.dart';
import 'package:lettutor_advanced_mobile/modules/widgets/custom_search_bar.dart';

import '../../../data/models/schedule.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key}) : super(key: key);

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
