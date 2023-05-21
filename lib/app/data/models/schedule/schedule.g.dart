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
      startPeriodTimestamp:
          Schedule._fromTimestamp(json['startPeriodTimestamp'] as int?),
      endPeriodTimestamp:
          Schedule._fromTimestamp(json['endPeriodTimestamp'] as int?),
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
      'startPeriodTimestamp':
          Schedule._toTimestamp(instance.startPeriodTimestamp),
      'endPeriodTimestamp': Schedule._toTimestamp(instance.endPeriodTimestamp),
      'tutorId': instance.tutorId,
      'tutorAvatar': instance.tutorAvatar,
      'tutorName': instance.tutorName,
    };
