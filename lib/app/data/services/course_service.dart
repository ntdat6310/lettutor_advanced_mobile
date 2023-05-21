import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

class CourseService {
  Future<List<Course>> getListCourseWithSearchAndFilterAndPagination({
    int page = 1,
    int size = 100,
    String searchKey = '',
    String levelKey = '0',
    String? categoryId,
  }) async {
    Map<String, dynamic> query = {
      'page': '$page',
      'size': '$size',
      'q': searchKey,
    };
    if (levelKey != '0') {
      query['level[]'] = levelKey;
    }
    if (categoryId != null && categoryId != '') {
      query['categoryId[]'] = categoryId;
    }
    try {
      debugPrint("QUERY $query");
      dio.Response response = await APIHandlerImp.instance.get(
          endpoint:
              BackendEnvironment.getListCourseWithSearchAndFilterAndPagination,
          useToken: true,
          query: query);
      if (response.statusCode == 200) {
        List<dynamic> coursesJson = response.data['data']['rows'];
        List<Course>? courses = coursesJson.map((courseJson) {
          return Course.fromJson(courseJson);
        }).toList();
        return courses;
      } else if (response.statusCode == 401) {
        debugPrint(
            "CourseService.getListCourseWithSearchAndFilterAndPagination: Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint(
          "CourseService.getListCourseWithSearchAndFilterAndPagination: ${e.toString()}");
    }
    return [];
  }

  Future<Map<String, String>> getCourseCategory() async {
    Map<String, String> result = {
      '': 'Any Category',
    };

    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getCourseCategory,
        useToken: true,
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsons = response.data['rows'];
        for (var json in jsons) {
          result[json['id']] = json['title'];
        }
      } else {
        debugPrint(
            "CourseService.getCourseCategory: Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("CourseService.getCourseCategory: ${e.toString()}");
    }
    return result;
  }
}
