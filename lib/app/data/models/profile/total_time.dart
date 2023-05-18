import 'package:json_annotation/json_annotation.dart';

class TotalTime {
  late final int hours;
  late final int minutes;
  TotalTime({required int minutes}) {
    hours = minutes ~/ 60;
    this.minutes = minutes % 60;
  }
}
