import 'package:lettutor_advanced_mobile/data/models/teacher.dart';

class Schedule {
  late Teacher teacher;
  late DateTime fromTime;
  late DateTime toTime;
  late int studentId;

  Schedule(
      {required this.teacher, required this.studentId, required this.fromTime, required this.toTime});
}
