import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/schedule.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

import '../../core/constants/backend_environment.dart';

class ScheduleService {
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
        query['dateTimeLte'] = dateTimeLte;
      }

      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getUpcomingSchedules,
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
          debugPrint("id ${newSchedule['id'].runtimeType}");
          debugPrint("userId ${newSchedule['userId'].runtimeType}");
          debugPrint(
              "scheduleDetailId ${newSchedule['scheduleDetailId'].runtimeType}");
          debugPrint(
              "tutorMeetingLink ${newSchedule['tutorMeetingLink'].runtimeType}");
          debugPrint(
              "studentMeetingLink ${newSchedule['studentMeetingLink'].runtimeType}");
          debugPrint(
              "studentRequest ${newSchedule['studentRequest'].runtimeType}");
          debugPrint(
              "startPeriodTimestamp ${newSchedule['startPeriodTimestamp'].runtimeType}");
          debugPrint(
              "endPeriodTimestamp ${newSchedule['endPeriodTimestamp'].runtimeType}");
          debugPrint("tutorId ${newSchedule['tutorId'].runtimeType}");
          debugPrint("tutorAvatar ${newSchedule['tutorAvatar'].runtimeType}");
          debugPrint("tutorName ${newSchedule['tutorName'].runtimeType}");
          debugPrint("__________________________________");
          debugPrint(
              "startPeriodTimestamp ${newSchedule['startPeriodTimestamp']}");
          debugPrint("endPeriodTimestamp ${newSchedule['endPeriodTimestamp']}");
          return Schedule.fromJson(newSchedule);
        }).toList();
      }
      debugPrint(
          "ScheduleService.getUpcomingSchedules failed with status code: ${response.statusCode}");
    } catch (e) {
      debugPrint("ScheduleService.getUpcomingSchedules: ${e.toString()}");
    }
    return [];
  }
}
