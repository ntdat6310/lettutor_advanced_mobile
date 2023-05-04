// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleHistory _$ScheduleHistoryFromJson(Map<String, dynamic> json) =>
    ScheduleHistory(
      id: json['id'] as String?,
      studentId: json['studentId'] as String?,
      tutorId: json['tutorId'] as String?,
      tutorAvatar: json['tutorAvatar'] as String?,
      tutorName: json['tutorName'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$ScheduleHistoryToJson(ScheduleHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'tutorId': instance.tutorId,
      'tutorAvatar': instance.tutorAvatar,
      'tutorName': instance.tutorName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
