// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleBooking _$ScheduleBookingFromJson(Map<String, dynamic> json) =>
    ScheduleBooking(
      scheduleDetailId: json['id'] as String?,
      startPeriodTimestamp:
          ScheduleBooking._fromTimestamp(json['startPeriodTimestamp'] as int?),
      endPeriodTimestamp:
          ScheduleBooking._fromTimestamp(json['endPeriodTimestamp'] as int?),
      isBooked: const RxBoolConverter().fromJson(json['isBooked'] as bool),
    );

Map<String, dynamic> _$ScheduleBookingToJson(ScheduleBooking instance) =>
    <String, dynamic>{
      'id': instance.scheduleDetailId,
      'startPeriodTimestamp':
          ScheduleBooking._toTimestamp(instance.startPeriodTimestamp),
      'endPeriodTimestamp':
          ScheduleBooking._toTimestamp(instance.endPeriodTimestamp),
      'isBooked': const RxBoolConverter().toJson(instance.isBooked),
    };
