import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/course_service.dart';

import '../../data/models/course/course.dart';

class CourseController extends GetxController {
  CourseService _courseService = Get.put(CourseService());
  RxList<Course> courses = RxList<Course>([]);
  RxBool isLoading = false.obs;
  String searchKey = '';

  Future<bool> searchCourses({String searchKey = ''}) async {
    this.searchKey = searchKey;
    isLoading.value = true;
    List<Course>? results = await _courseService
        .getListCourseWithSearchAndFilterAndPagination(searchKey: searchKey);
    if (results != null) {
      courses.clear();
      courses.addAll(results);
      isLoading.value = false;
      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }
  Course? getCourseById(String courseId){
    for(Course course in courses){
      if(course.id == courseId){
        return course;
      }
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    searchCourses();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
