import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../../data/models/schedule/schedule.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.schedule,
    this.onCancelBookingClicked,
    this.fromView = "SCHEDULE",
    this.onJoinMeeting,
  }) : super(key: key);

  final Schedule schedule;
  final Function(Schedule)? onCancelBookingClicked;
  final Function({required Schedule schedule})? onJoinMeeting;
  final String fromView;
  Widget _showAvatar() {
    if (schedule.tutorAvatar != null) {
      return CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(schedule.tutorAvatar ?? ''),
      );
    } else {
      return const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('/assets/images/default_user.png'),
      );
    }
  }

  Widget _showTutorReview() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        'tutor_have_not_reviewed_yet'.tr,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.redAccent,
          backgroundColor: Colors.white24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (fromView == "SCHEDULE_HISTORY" && schedule.hasEnded == false) {
      return const SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _showAvatar(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schedule.tutorName ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('EEE, dd/MM/y')
                                  .format(schedule.startPeriodTimestamp!),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 1,
                                  )),
                              child: Text(
                                "${DateFormat('HH:mm').format(schedule.startPeriodTimestamp!)} - ${DateFormat('HH:mm').format(schedule.endPeriodTimestamp!)}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        schedule.hasEnded
                            ? _showTutorReview()
                            : const SizedBox.shrink(),
                      ],
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                schedule.hasEnded
                    ? SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.blueAccent,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  onPressed: () {
                                    // TODO: add button press logic here
                                  },
                                  child: Text('send_message'.tr),
                                )),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('give_feedback'.tr),
                                )),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: schedule.canCancelBooking
                                  ? () {
                                      if (onCancelBookingClicked != null) {
                                        onCancelBookingClicked!(schedule);
                                      } else {
                                        debugPrint(
                                            "ScheduleCard.onCancelBookingClicked: $onCancelBookingClicked");
                                      }
                                    }
                                  : null,
                              child: Text('cancel'.tr),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () {
                                if (onJoinMeeting != null) {
                                  onJoinMeeting!(schedule: schedule);
                                }
                                // Get.toNamed(Routes.MEETING_VIDEO_CONFERENCE);
                              },
                              child: Text('go_to_meeting'.tr),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
