import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/core/utils/helpers.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';

import '../../data/models/teacher/teacher.dart';

class TeacherDetailController extends GetxController {
  late Teacher teacher;
  RxList<String> languageNames = <String>[].obs;
  RxList<String> specialtyValues = <String>[].obs;
  final TeacherService teacherService = Get.find();
  RxBool isLoading = true.obs;
  RxList<RatingComment> feedbacks = RxList<RatingComment>();

  TeacherDetailController({required this.teacher});

  @override
  void onInit() async {
    super.onInit();
    languageNames
        .addAll(await Helper.getLanguageNames(teacher.languages ?? ''));
    specialtyValues.addAll(
        await Helper.getSpecialties(specialtiesStr: teacher.specialties ?? ''));
    List<RatingComment>? results = await teacherService.getFeedbacksByTeacherId(
        teacherId: teacher.userId ?? '');
    if (results != null) {
      feedbacks.addAll(results);
    }
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}
