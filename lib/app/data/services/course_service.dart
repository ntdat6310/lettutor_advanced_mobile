import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

class CourseService {
  Future<List<Course>?> getListCourseWithSearchAndFilterAndPagination({
    int page = 1,
    int size = 100,
    String searchKey = '',
  }) async {
    Map<String, dynamic> query = {
      'page': '$page',
      'size': '$size',
      'q': searchKey,
    };
    try {
      dio.Response response = await APIHandlerImp.instance.get(
          endpoint:
              BackendEnvironment.getListCourseWithSearchAndFilterAndPagination,
          useToken: true,
          query: query);
      if (response.statusCode == 200) {
        debugPrint("__________________1___________________");
        debugPrint(response.data.toString());
        List<dynamic> coursesJson = response.data['data']['rows'];
        debugPrint("__________________2___________________");
        List<Course>? courses = coursesJson.map((courseJson) {
          debugPrint("__________________3___________________");
          return Course.fromJson(courseJson);
        }).toList();
        return courses;
      } else if (response.statusCode == 401) {
        debugPrint(
            "CourseService.getListCourseWithSearchAndFilterAndPagination: Failed with status code ${response.statusCode}");
      }
      // else {}
    } catch (e) {
      debugPrint(
          "CourseService.getListCourseWithSearchAndFilterAndPagination: ${e.toString()}");
    }
    return null;
  }
}
