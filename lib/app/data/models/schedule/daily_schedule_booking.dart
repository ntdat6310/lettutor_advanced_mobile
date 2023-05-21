import 'schedule_booking.dart';

class DailyScheduleBooking {
  late final List<ScheduleBooking> schedules;
  late final DateTime date;

  DailyScheduleBooking({
    required this.schedules,
    required this.date,
  });

  static List<DailyScheduleBooking> groupByDay({required List<ScheduleBooking> bookings}) {
    Map<DateTime, List<ScheduleBooking>> groupedBookings = {};

    for (var booking in bookings) {
      if (booking.startPeriodTimestamp != null) {
        // Chỉ lấy phần ngày từ DateTime, bỏ qua thời gian.
        var date = DateTime(
          booking.startPeriodTimestamp!.year,
          booking.startPeriodTimestamp!.month,
          booking.startPeriodTimestamp!.day,
        );

        if (groupedBookings.containsKey(date)) {
          groupedBookings[date]!.add(booking);
        } else {
          groupedBookings[date] = [booking];
        }
      }
    }

    // Chuyển đổi từ Map sang List<DailyScheduleBookings>
    return groupedBookings.entries.map((entry) {
      return DailyScheduleBooking(date: entry.key, schedules: entry.value);
    }).toList();
  }
}
