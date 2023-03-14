import 'package:lettutor_advanced_mobile/data/models/schedule.dart';

class ScheduleHistory {
  int id = 0;
  Schedule schedule;
  String teacherComment = '';

  ScheduleHistory({
    required this.schedule,
    required this.teacherComment,
  });
}
