import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

class TeacherService {
  Future<List<Teacher>?> getListTutorWithPagination({
    int perPage = 3,
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
        List<Teacher> teachers = (teachersJson.map<Teacher>((teacherJson){
          return Teacher.fromJson(teacherJson);
        })).toList();
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
        // debugPrint("teachers---------------------------");
        // debugPrint(teachers[0].feedbacks?.length.toString());
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
