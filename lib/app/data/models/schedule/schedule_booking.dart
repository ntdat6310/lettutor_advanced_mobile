import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';

part 'schedule_booking.g.dart';

@JsonSerializable()
class ScheduleBooking {
  @JsonKey(name: 'id')
  String? scheduleDetailId;

  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  DateTime? startPeriodTimestamp;

  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  DateTime? endPeriodTimestamp;

  @RxBoolConverter()
  RxBool isBooked = false.obs;

  ScheduleBooking({
    this.scheduleDetailId,
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    required this.isBooked,
  });

  factory ScheduleBooking.fromJson(Map<String, dynamic> json) =>
      _$ScheduleBookingFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleBookingToJson(this);

  static DateTime? _fromTimestamp(int? timestamp) {
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  static int? _toTimestamp(DateTime? dateTime) {
    return dateTime?.millisecondsSinceEpoch;
  }
}
