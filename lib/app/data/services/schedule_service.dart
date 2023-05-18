import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/cancel_reason.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/daily_schedule_booking.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/schedule.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/schedule_booking.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

import '../../core/constants/backend_environment.dart';
import '../../core/utils/helpers.dart';

class ScheduleService {
  Future<Schedule?> getUpcomingSchedule() async {
    try {
      Map<String, dynamic> query = {
        'dateTime': DateTime.now().millisecondsSinceEpoch.toString(),
      };

      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getUpcomingSchedule,
        useToken: true,
        query: query,
      );

      if (response.statusCode == 200) {
        List<dynamic> scheduleJSONs = response.data['data'];
        List<Schedule> schedules = scheduleJSONs.map<Schedule>((scheduleJSON) {
          Map<String, dynamic> newSchedule = {
            'id': scheduleJSON['id'],
            'userId': scheduleJSON['userId'],
            'scheduleDetailId': scheduleJSON['scheduleDetailId'],
            'tutorMeetingLink': scheduleJSON['tutorMeetingLink'],
            'studentMeetingLink': scheduleJSON['studentMeetingLink'],
            'studentRequest': scheduleJSON['studentRequest'],
            'startPeriodTimestamp': scheduleJSON['scheduleDetailInfo']
                ['startPeriodTimestamp'],
            'endPeriodTimestamp': scheduleJSON['scheduleDetailInfo']
                ['endPeriodTimestamp'],
            'tutorId': scheduleJSON['scheduleDetailInfo']['scheduleInfo']
                ['tutorId'],
            'tutorAvatar': scheduleJSON['scheduleDetailInfo']['scheduleInfo']
                ['tutorInfo']['avatar'],
            'tutorName': scheduleJSON['scheduleDetailInfo']['scheduleInfo']
                ['tutorInfo']['name'],
          };
          return Schedule.fromJson(newSchedule);
        }).toList();

        return Schedule.sortScheduleByStartTime(
          schedules: schedules,
          isAscending: true,
        )[0];
      }
      debugPrint(
          "ScheduleService.getUpcomingSchedule failed with status code: ${response.statusCode}");
    } catch (e) {
      debugPrint("ScheduleService.getUpcomingSchedule: ${e.toString()}");
    }
    return null;
  }

  Future<List<Schedule>> getAllSchedules({
    int page = 1,
    int perPage = 12,
  }) {
    return _getSchedules(
      page: page,
      perPage: perPage,
    );
  }

  Future<List<Schedule>> getHistorySchedules({
    int page = 1,
    int perPage = 12,
  }) {
    return _getSchedules(
      page: page,
      perPage: perPage,
      dateTimeLte: DateTime.now(),
    );
  }

  Future<List<CancelReason>> getCancelReasons() async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.cancelReasons,
        useToken: true,
      );
      if (response.statusCode == 200) {
        List<dynamic> cancelReasonJSONs = response.data['rows'];
        return cancelReasonJSONs.map<CancelReason>((cancelReasonJSON) {
          return CancelReason.fromJson(cancelReasonJSON);
        }).toList();
      }
      debugPrint(
          "ScheduleService.getCancelReasons failed with status code: ${response.statusCode}");
    } catch (e) {
      debugPrint("ScheduleService.getCancelReasons: ${e.toString()}");
    }
    return [];
  }

  Future<bool> cancelBooking({
    required String id,
    required int cancelReasonId,
    String note = '',
  }) async {
    try {
      Map<String, dynamic> body = {
        "scheduleDetailId": id,
        "cancelInfo": {
          "cancelReasonId": cancelReasonId,
          "note": note,
        }
      };
      debugPrint("ScheduleService.cancelBooking---------------------------");
      debugPrint("body: ${body.toString()}");
      dio.Response response = await APIHandlerImp.instance.delete(
        endpoint: BackendEnvironment.cancelBooking,
        useToken: true,
        body: body,
      );
      if (response.statusCode == 200) {
        return true;
      }
      debugPrint(
          "ScheduleService.cancelBooking failed with status code: ${response.statusCode}");
      debugPrint("Message: ${response.statusMessage}");
    } catch (e) {
      debugPrint("ScheduleService.cancelBooking: ${e.toString()}");
    }
    return false;
  }

  Future<List<Schedule>> _getSchedules({
    int page = 1,
    int perPage = 12,
    DateTime? dateTimeLte,
  }) async {
    try {
      Map<String, dynamic> query = {
        'page': '$page',
        'perPage': '$perPage',
        'orderBy': 'meeting',
        'sortBy': 'desc',
      };
      if (dateTimeLte != null) {
        query['dateTimeLte'] = "${dateTimeLte.millisecondsSinceEpoch}";
      }

      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getSchedulesBooked,
        useToken: true,
        query: query,
      );
      if (response.statusCode == 200) {
        List<dynamic> scheduleJSONs = response.data['data']['rows'];
        return scheduleJSONs.map<Schedule>((scheduleJSON) {
          Map<String, dynamic> newSchedule = {
            'id': scheduleJSON['id'],
            'userId': scheduleJSON['userId'],
            'scheduleDetailId': scheduleJSON['scheduleDetailId'],
            'tutorMeetingLink': scheduleJSON['tutorMeetingLink'],
            'studentMeetingLink': scheduleJSON['studentMeetingLink'],
            'studentRequest': scheduleJSON['studentRequest'],
            'startPeriodTimestamp': scheduleJSON['scheduleDetailInfo']
                ['startPeriodTimestamp'],
            'endPeriodTimestamp': scheduleJSON['scheduleDetailInfo']
                ['endPeriodTimestamp'],
            'tutorId': scheduleJSON['scheduleDetailInfo']['scheduleInfo']
                ['tutorId'],
            'tutorAvatar': scheduleJSON['scheduleDetailInfo']['scheduleInfo']
                ['tutorInfo']['avatar'],
            'tutorName': scheduleJSON['scheduleDetailInfo']['scheduleInfo']
                ['tutorInfo']['name'],
          };
          return Schedule.fromJson(newSchedule);
        }).toList();
      }
      debugPrint(
          "ScheduleService._getSchedules failed with status code: ${response.statusCode}");
    } catch (e) {
      debugPrint("ScheduleService._getSchedules: ${e.toString()}");
    }
    return [];
  }

  Future<List<DailyScheduleBooking>> getSchedulesToBookByTutorId(
      {required String tutorId,
      required String startDay,
      required String endDay}) async {
    try {
      Map<String, dynamic> query = {
        'tutorId': tutorId,
        'startTimestamp': Helper.parseDateFromString(startDay)
            .millisecondsSinceEpoch
            .toString(),
        'endTimestamp': Helper.parseDateFromString(endDay)
            .millisecondsSinceEpoch
            .toString(),
      };
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getSchedulesToBookByTutorId,
        useToken: true,
        query: query,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsons = response.data['scheduleOfTutor'];

        List<ScheduleBooking> bookings = jsons.map<ScheduleBooking>((json) {
          return ScheduleBooking.fromJson(json['scheduleDetails'][0]);
        }).toList();

        bookings = Helper.filterBookingSchedules(schedules: bookings);
        bookings = Helper.sortBookingSchedules(
            schedules: bookings, isOrderAscending: true);

        debugPrint("SCHEDULE BOOKING LENGTH: ${bookings.length}");

        for (int i = 0; i < bookings.length; i++) {
          debugPrint("$i : ${bookings[i].startPeriodTimestamp}");
        }

        List<DailyScheduleBooking> dailyBookings =
            DailyScheduleBooking.groupByDay(bookings: bookings);
        debugPrint("-------------------------------------------");
        debugPrint("DAILY SCHEDULE BOOKING LENGTH: ${dailyBookings.length}");
        for (int i = 0; i < dailyBookings.length; i++) {
          debugPrint("$i : ${dailyBookings[i].date.toString()}");
        }
        return dailyBookings;
      }
      debugPrint(
          "ScheduleService.getSchedulesToBookByTutorId failed with status code: ${response.statusCode}");
    } catch (e) {
      debugPrint(
          "ScheduleService.getSchedulesToBookByTutorId: ${e.toString()}");
    }
    return [];
  }

  // Future<List<DailyScheduleBooking>> getSchedulesToBookByTutorId(
  //     {required String tutorId, required String startDay, required String endDay}) async {
  //   try {
  //     Map<String, dynamic> body = {'tutorId': tutorId};
  //     dio.Response response = await APIHandlerImp.instance.post(
  //       endpoint: BackendEnvironment.getSchedulesToBookByTutorId,
  //       useToken: true,
  //       body: body,
  //     );
  //     if (response.statusCode == 200) {
  //       List<dynamic> jsons = response.data['data'];
  //
  //       List<ScheduleBooking> bookings = jsons.map<ScheduleBooking>((json) {
  //         return ScheduleBooking.fromJson(json['scheduleDetails'][0]);
  //       }).toList();
  //
  //       bookings = Helper.filterBookingSchedules(schedules: bookings);
  //       bookings = Helper.sortBookingSchedules(
  //           schedules: bookings, isOrderAscending: true);
  //
  //       debugPrint("SCHEDULE BOOKING LENGTH: ${bookings.length}");
  //
  //       for (int i = 0; i < bookings.length; i++) {
  //         debugPrint("$i : ${bookings[i].startPeriodTimestamp}");
  //       }
  //
  //       List<DailyScheduleBooking> dailyBookings = DailyScheduleBooking.groupByDay(bookings: bookings);
  //       debugPrint("-------------------------------------------");
  //       debugPrint("DAILY SCHEDULE BOOKING LENGTH: ${dailyBookings.length}");
  //       for (int i = 0; i < dailyBookings.length; i++) {
  //         debugPrint("$i : ${dailyBookings[i].date.toString()}");
  //       }
  //       return dailyBookings;
  //     }
  //     debugPrint(
  //         "ScheduleService.getSchedulesToBookByTutorId failed with status code: ${response.statusCode}");
  //   } catch (e) {
  //     debugPrint(
  //         "ScheduleService.getSchedulesToBookByTutorId: ${e.toString()}");
  //   }
  //   return [];
  // }

  Future<bool> bookASchedule(
      {required String scheduleDetailId, String note = ''}) async {
    try {
      Map<String, dynamic> body = {
        'scheduleDetailIds': [scheduleDetailId],
        'note': note,
      };

      dio.Response response = await APIHandlerImp.instance.post(
        endpoint: BackendEnvironment.bookASchedule,
        useToken: true,
        body: body,
      );
      if (response.statusCode == 200) {
        return true;
      }
      debugPrint(
          "ScheduleService.bookASchedule failed with status code: ${response.statusCode}");
    } catch (e) {
      debugPrint("ScheduleService.bookASchedule: ${e.toString()}");
    }
    return false;
  }
}
