import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule{
  String? id;
  @JsonKey(name: 'userId')
  String? studentId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  DateTime? startPeriodTimestamp;
  DateTime? endPeriodTimestamp;
  String? tutorId;
  String? tutorAvatar;
  String? tutorName;

  Schedule({
    this.id,
    this.studentId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.tutorId,
    this.tutorAvatar,
    this.tutorName,
});
  factory Schedule.fromJson(Map<String, dynamic> json)
  => _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}