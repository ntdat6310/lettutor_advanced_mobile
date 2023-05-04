// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      id: json['id'] as String?,
      studentId: json['userId'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      studentMeetingLink: json['studentMeetingLink'] as String?,
      studentRequest: json['studentRequest'] as String?,
      startPeriodTimestamp: json['startPeriodTimestamp'] == null
          ? null
          : DateTime.parse(json['startPeriodTimestamp'] as String),
      endPeriodTimestamp: json['endPeriodTimestamp'] == null
          ? null
          : DateTime.parse(json['endPeriodTimestamp'] as String),
      tutorId: json['tutorId'] as String?,
      tutorAvatar: json['tutorAvatar'] as String?,
      tutorName: json['tutorName'] as String?,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.studentId,
      'scheduleDetailId': instance.scheduleDetailId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
      'studentRequest': instance.studentRequest,
      'startPeriodTimestamp': instance.startPeriodTimestamp?.toIso8601String(),
      'endPeriodTimestamp': instance.endPeriodTimestamp?.toIso8601String(),
      'tutorId': instance.tutorId,
      'tutorAvatar': instance.tutorAvatar,
      'tutorName': instance.tutorName,
    };
