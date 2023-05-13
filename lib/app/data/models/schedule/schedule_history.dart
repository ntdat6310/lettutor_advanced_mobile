import 'package:json_annotation/json_annotation.dart';

part 'schedule_history.g.dart';

@JsonSerializable()
class ScheduleHistory{
  String? id;
  String? studentId;
  String? tutorId;
  String? tutorAvatar;
  String? tutorName;
  String? startTime;
  String? endTime;

  ScheduleHistory({
    this.id,
    this.studentId,
    this.tutorId,
    this.tutorAvatar,
    this.tutorName,
    this.startTime,
    this.endTime,
  });

  factory ScheduleHistory.fromJson(Map<String, dynamic> json)
  => _$ScheduleHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleHistoryToJson(this);
}