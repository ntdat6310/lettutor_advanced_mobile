import 'package:lettutor_advanced_mobile/data/models/teacher.dart';

class Schedule {
  late Teacher teacher;
  late DateTime fromTime;
  late DateTime toTime;

  Schedule(
      {required this.teacher, required this.fromTime, required this.toTime});
}
