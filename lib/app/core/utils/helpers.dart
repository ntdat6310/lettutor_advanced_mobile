import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../data/models/schedule/schedule_booking.dart';

class Helper {
  static int roundHalfUp(double number) {
    int wholeNumber = number.toInt();
    double fraction = number - wholeNumber;
    if (fraction >= 0.5) {
      return wholeNumber + 1;
    } else {
      return wholeNumber;
    }
  }

  static Future<Map<String, String>> _loadLanguageCodes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/language_codes.json');
    return json.decode(jsonString).cast<String, String>();
  }

  static Future<Map<String, String>> _loadSpecialties() async {
    String jsonString =
        await rootBundle.loadString('assets/json/specialties.json');
    return json.decode(jsonString).cast<String, String>();
  }

  static Future<List<String>> getSpecialties(
      {required String specialtiesStr}) async {
    Map<String, String> specialtiesMap = await _loadSpecialties();
    List<String> specialtyKeys = specialtiesStr.split(',');
    List<String> specialtyValues = [];
    for (String key in specialtyKeys) {
      String value = specialtiesMap[key] ?? key;
      specialtyValues.add(value);
    }
    return specialtyValues;
  }

  static Future<Map<String, String>> getLanguagesMap() async {
    return await _loadLanguageCodes();
  }

  static Future<List<String>> getLanguageNames(String languages) async {
    Map<String, String> languageMap = await _loadLanguageCodes();

    List<String> languageCodes = languages.split(',');
    List<String> languageNames = [];
    for (String code in languageCodes) {
      String name = languageMap[code] ?? code;
      languageNames.add(name);
    }
    return languageNames;
  }

  static DateTime convertDateStringToDateTime({String? dateString}) {
    if (dateString == null) {
      return DateTime.now();
    }

    try {
      return DateTime.parse(dateString);
    } catch (e) {
      debugPrint("Helper.convertDateStringToDateTime: $e");
      return DateTime.now();
    }
  }

  static List<ScheduleBooking> filterBookingSchedules(
      {required List<ScheduleBooking> schedules}) {
    final now = DateTime.now();
    // Ignore time part of current DateTime.
    final today = DateTime(now.year, now.month, now.day);
    return schedules.where((schedule) {
      // Check if schedule's startPeriodTimestamp is today or in the future
      return schedule.startPeriodTimestamp != null &&
          (schedule.startPeriodTimestamp!.isAfter(today) ||
              schedule.startPeriodTimestamp!.isAtSameMomentAs(today));
    }).toList();
  }

  static List<ScheduleBooking> sortBookingSchedules({
    bool isOrderAscending = true,
    required List<ScheduleBooking> schedules,
  }) {
    schedules.sort((a, b) {
      if (a.startPeriodTimestamp == null) {
        return 1;
      } else if (b.startPeriodTimestamp == null) {
        return -1;
      } else {
        return a.startPeriodTimestamp!.compareTo(b.startPeriodTimestamp!);
      }
    });

    if (!isOrderAscending) {
      schedules = schedules.reversed.toList();
    }
    return schedules;
  }

  static DateTime parseDateFromString(String date) {
    return DateFormat("dd-MM-yyyy").parse(date);
  }
}
