import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/schedule/schedule.dart';
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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SizedBox(width: double.infinity, child: UpcomingLesson()),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            sliver: PagedSliverList<int, Schedule>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Schedule>(
                itemBuilder: (context, schedule, index) => ScheduleCard(
                  schedule: schedule,
                  onCancelBookingClicked: controller.showCancelDialog,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
