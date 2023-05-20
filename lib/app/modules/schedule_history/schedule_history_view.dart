import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/schedule/schedule.dart';
import '../schedule/components/schedule_card.dart';
import '../widgets/custom_appbar.dart';
import 'schedule_history_controller.dart';

class ScheduleHistoryView extends GetView<ScheduleHistoryController> {
  ScheduleHistoryView({Key? key}) : super(key: key);
  final scheduleHistoryController =
      Get.put<ScheduleHistoryController>(ScheduleHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "history_schedule".tr,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            sliver: PagedSliverList<int, Schedule>(
              pagingController: scheduleHistoryController.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Schedule>(
                itemBuilder: (context, schedule, index) => ScheduleCard(
                  schedule: schedule,
                  fromView: "SCHEDULE_HISTORY",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
