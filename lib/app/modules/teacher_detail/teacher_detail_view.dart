import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/rating_star.dart';
import 'components/booking_button.dart';
import 'components/chip_info.dart';
import 'components/message_favorite_report.dart';
import 'components/review_list.dart';
import 'components/teacher_desc.dart';
import 'components/teaching_experience.dart';
import 'components/video_intro_view.dart';
import 'teacher_detail_controller.dart';

class TeacherDetailView extends GetView<TeacherDetailController> {
  const TeacherDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "",
      ),
      body: !controller.isLoading.value
          ? const CircularProgressIndicator(
              color: Colors.blueAccent,
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VideoIntro(
                      videoUrl: controller.teacher.video ??
                          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundImage: controller.teacher.avatar != null
                              ? NetworkImage(controller.teacher.avatar ?? '')
                              : const AssetImage(
                                      'assets/images/default_user.png')
                                  as ImageProvider<Object>,
                          radius: 45,
                        ),
                        const SizedBox(width: 10),
                        Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(4, 0, 0, 8),
                                  child: Text(
                                    controller.teacher.name ?? '',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                RatingStar(
                                    rating: controller.teacher.rating ?? 0),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(4, 8, 0, 0),
                                  child: Text(
                                    controller.teacher.country ?? '',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: MessageFavoriteReport(
                        teacher: controller.teacher,
                      ),
                    ),
                    BookingButton(teacher: controller.teacher),
                    const SizedBox(height: 20),
                    TeacherDescription(
                      description: controller.teacher.bio ?? '',
                    ),
                    ChipInfo(
                      title: "languages".tr,
                      chipList: controller.languageNames,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ChipInfo(
                      title: "specialties".tr,
                      chipList: controller.specialtyValues,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionWithTitleAndContent(
                        content: controller.teacher.interests ?? 'no'.tr,
                        title: 'interests'.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionWithTitleAndContent(
                        title: 'teaching_experience'.tr,
                        content:
                            controller.teacher.experience ?? 'no'.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    ReviewList(reviews: controller.feedbacks),
                  ],
                ),
              ),
            ),
    );
  }
}
