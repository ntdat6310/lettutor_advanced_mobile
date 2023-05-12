import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/test_preparation.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

import '../models/profile/profile.dart';

class ProfileService {
  Future<Profile?> getProfile() async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getProfile,
        useToken: true,
      );
      if (response.statusCode == 200) {
        Profile result = Profile.fromJson(response.data['user']);
        debugPrint("ProfileService.getProfile: ${result.toJson().toString()}");
        return result;
      }
    } catch (e) {
      debugPrint("ProfileService.getProfile: ${e.toString()}");
    }
    return null;
  }

  Future<List<TestPreparation>> getAllTestPreparations() async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getTestPreparation,
      );
      if (response.statusCode == 200) {
        List<dynamic> testPreparationJsons = response.data;
        List<TestPreparation> results =
            testPreparationJsons.map<TestPreparation>((testPreparationJson) {
          return TestPreparation.fromJson(testPreparationJson);
        }).toList();
        debugPrint("TestPreparation length: ${results.length}");
        debugPrint("TestPreparation: ${results.toString()}");
        return results;
      }
    } catch (e) {
      debugPrint("ProfileService.getTestPreparations: ${e.toString()}");
    }
    return [];
  }

  Future<void> updateProfile({required Profile profile}) async {
    try {
      // {
      //     "name": "Phhai",
      //     "country": "JP",
      //     "phone": "842499996508",
      //     "birthday": "2002-07-30",
      //     "level": "INTERMEDIATE",
      //     "learnTopics": [
      //         "3",
      //         "5"
      //     ],
      //     "studySchedule": "123",
      //     "testPreparations": [
      //         "3",
      //         "4",
      //         "2"
      //     ]
      // }
      Map<String, dynamic> body = {};

      dio.Response response = await APIHandlerImp.instance.put(
        endpoint: BackendEnvironment.updateProfile,
        body: body,
        useToken: true,
      );
    } catch (e) {
      debugPrint("ProfileService.updateProfile: ${e.toString()}");
    }
  }

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
}
