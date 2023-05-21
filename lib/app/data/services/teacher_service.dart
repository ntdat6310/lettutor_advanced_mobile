import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

class TeacherService {
  Future<bool> toggleFavoriteTutor({required String tutorId}) async {
    try {
      dio.Response response = await APIHandlerImp.instance.post(
        body: {"tutorId": tutorId},
        endpoint: BackendEnvironment.toggleFavoriteTutor,
        useToken: true,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint(
            "TeacherService.toggleFavoriteTutor: Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("TeacherService.toggleFavoriteTutor: ${e.toString()}");
    }
    return false;
  }

  void sortTeachersByFavoriteAndRating({required List<Teacher> teachers}) {
    teachers.sort((a, b) {
      if (a.isFavorite != b.isFavorite) {
        return a.isFavorite.value ? -1 : 1;
      } else {
        if (a.rating == null && b.rating == null) {
          return 0;
        } else if (a.rating == null) {
          return 1;
        } else if (b.rating == null) {
          return -1;
        } else {
          return b.rating!.compareTo(a.rating!);
        }
      }
    });
  }

  Future<List<RatingComment>?> getFeedbacksByTeacherId({
    required String teacherId,
    int perPage = 12,
    int page = 1,
  }) async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint:
            BackendEnvironment.getFeedbacksByTeacherId(teacherId: teacherId),
        query: {'perPage': '$perPage', 'page': '$page'},
        useToken: true,
      );
      if (response.statusCode == 200 && response.data['message'] == 'Success') {
        List<dynamic> feedbacksJson = response.data['data']['rows'];
        List<RatingComment>? feedbacks =
            feedbacksJson.map<RatingComment>((feedbackJson) {
          feedbackJson['name'] = feedbackJson['firstInfo']['name'];
          feedbackJson['avatar'] = feedbackJson['firstInfo']['avatar'];
          return RatingComment.fromJson(feedbackJson);
        }).toList();
        return feedbacks;
      } else if (response.statusCode == 401) {
        // Login again!
        return null;
      } else {
        debugPrint(
            "TeacherService.getFeedbacksByTeacherId: Failed with status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("TeacherService.getFeedbacksByTeacherId: ${e.toString()}");
    }
    return null;
  }

  Future<List<Teacher>> getListTutorWithSearchAndFilterAndPagination({
    int perPage = 12,
    int page = 1,
    String searchKey = '',
    List<String>? specialties,
  }) async {
    Map<String, dynamic> body = {
      "search": searchKey,
      "page": '$page',
      "perPage": '$perPage',
    };
    if (specialties != null) {
      body['filters'] = {"specialties": specialties};
    }
    try {
      dio.Response response = await APIHandlerImp.instance.post(
        body: body,
        endpoint:
            BackendEnvironment.getListTutorWithSearchAndFilterAndPagination,
        useToken: true,
      );
      if (response.statusCode == 200) {
        List<dynamic> teachersJson = response.data['rows'];
        List<Teacher> teachers = (teachersJson.map<Teacher>((teacherJson) {
          if (teacherJson['isfavoritetutor'] == "1") {
            teacherJson['isfavoritetutor'] = true;
          } else {
            teacherJson['isfavoritetutor'] = false;
          }
          return Teacher.fromJson(teacherJson);
        })).toList();
        return teachers;
      } else {
        debugPrint(
            "TeacherService.getListTutorWithPagination: Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("TeacherService.getListTutorWithPagination: ${e.toString()}");
    }
    return [];
  }
}
