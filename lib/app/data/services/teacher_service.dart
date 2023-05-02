import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

class TeacherService {
  void updateFavoriteStatus({
    required List<Teacher> teachers,
    required List<String> favoriteTeacherIds,
  }) {
    for (var teacher in teachers) {
      teacher.isFavorite.value = favoriteTeacherIds.contains(teacher.userId);
    }
  }

  Future<bool> toggleFavoriteTutor({required String tutorId}) async {
    try {
      Response response = await APIHandlerImp.instance.post(
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

  Future<List<Teacher>?> getListTutorWithPagination({
    int perPage = 10,
    int page = 1,
  }) async {
    Map<String, String> query = {'perPage': '$perPage', 'page': '$page'};

    try {
      Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getListTutorWithPagination,
        useToken: true,
        query: query,
      );
      if (response.statusCode == 200) {
        List<dynamic> teachersJson = response.data['tutors']['rows'];
        List<dynamic> favoriteTeachersJson = response.data['favoriteTutor'];
        List<String> favoriteTeacherIds = [];
        for (var favoriteTeacherJson in favoriteTeachersJson) {
          String? favoriteTeacherId = favoriteTeacherJson['secondId'];
          if (favoriteTeacherId != null) {
            favoriteTeacherIds.add(favoriteTeacherId);
          }
        }
        List<Teacher> teachers = (teachersJson.map<Teacher>((teacherJson) {
          return Teacher.fromJson(teacherJson);
        })).toList();
        updateFavoriteStatus(
            teachers: teachers, favoriteTeacherIds: favoriteTeacherIds);
        // debugPrint("teachers.teachers.toString ${teachers.toString()}");
        // debugPrint("teachers.userId ${teachers[0].userId}");
        // debugPrint("teachers.email ${teachers[0].email}");
        // debugPrint("teachers.phone ${teachers[0].phone}");
        // debugPrint("teachers.languages ${teachers[0].languages}");
        // debugPrint("teachers.name ${teachers[0].name}");
        // debugPrint("teachers.level ${teachers[0].level}");
        // debugPrint("teachers.experience ${teachers[0].experience}");
        // debugPrint("teachers.rating ${teachers[0].rating}");
        // debugPrint("teachers.country ${teachers[0].country}");
        // debugPrint("teachers.birthday ${teachers[0].birthday}");
        debugPrint("teachers---------------------------");
        debugPrint(teachers[0].feedbacks?.length.toString());
        debugPrint(teachers[0].isFavorite.value.toString());
        return teachers;
      } else if (response.statusCode == 401) {
        // Login again!
        return null;
      } else {
        debugPrint(
            "TeacherService.getListTutorWithPagination: Failed with status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("TeacherService.getListTutorWithPagination: ${e.toString()}");
      return null;
    }
  }
}
