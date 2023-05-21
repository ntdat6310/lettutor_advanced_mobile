import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/core/utils/helpers.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';

import '../../data/models/teacher/teacher.dart';
import '../profile_setting/components/custom_text_field.dart';

class TeacherDetailController extends GetxController {
  late Teacher teacher;
  RxList<String> languageNames = <String>[].obs;
  RxList<String> specialtyValues = <String>[].obs;
  final TeacherService teacherService = Get.find();
  RxBool isLoading = true.obs;
  RxList<RatingComment> feedbacks = RxList<RatingComment>();
  TextEditingController reportController = TextEditingController();

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

  void showReportDialog() {
    Get.dialog(
      Dialog(
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "${'report'.tr} ${teacher.name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomTextField(
                textEditingController: reportController,
                hintText: 'report_content'.tr,
                minLines: 3,
                maxLines: 10,
                topSpacing: 8,
                bottomSpacing: 8,
                fontSize: 16,
                required: true,
                title: 'required'.tr,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      reportController.clear();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                    ),
                    child: Text('later'.tr),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      if (reportController.text.isNotEmpty) {
                        bool reportResult = await teacherService.reportTeacher(
                          tutorId: teacher.userId!,
                          content: reportController.text,
                        );
                        reportController.clear();
                        Get.back();
                        if (reportResult) {
                          Get.snackbar(
                            "report_success".tr,
                            '',
                            colorText: Colors.white,
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                          );
                        } else {
                          Get.snackbar(
                            "report_failed".tr,
                            '',
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 3),
                          );
                        }
                      }
                    },
                    child: Text('submit'.tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() async {
    reportController.dispose();
    super.onClose();
  }
}
