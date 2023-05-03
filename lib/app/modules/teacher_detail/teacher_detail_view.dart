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
import 'components/video_intro.dart';
import 'teacher_detail_controller.dart';

class TeacherDetailView extends GetView<TeacherDetailController> {
  TeacherDetailView({Key? key}) : super(key: key);

  TeacherDetailController c = Get.put(TeacherDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "",
      ),
      body: !c.isLoading.value
          ? const CircularProgressIndicator(
              color: Colors.blueAccent,
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VideoIntro(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundImage: c.teacher.avatar != null
                              ? NetworkImage(c.teacher.avatar ?? '')
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
                                    c.teacher.name ?? '',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                RatingStar(rating: c.teacher.rating ?? 0),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(4, 8, 0, 0),
                                  child: Text(
                                    c.teacher.country ?? '',
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
                        teacherId: c.teacher.userId ?? '',
                      ),
                    ),
                    BookingButton(),
                    const SizedBox(height: 20),
                    TeacherDescription(
                      description: c.teacher.bio ?? '',
                    ),
                    ChipInfo(
                      title: "Languages",
                      chipList: c.languageNames,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ChipInfo(
                      title: "Specialties",
                      chipList: c.specialtyValues,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ChipInfo(chipList: c.teacher.interests, title: "Interests"),
                    SectionWithTitleAndContent(
                        content: c.teacher.interests ?? 'No',
                        title: 'Interests'),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionWithTitleAndContent(
                        title: 'Teaching Experience',
                        content: c.teacher.experience ?? 'No experience'),
                    const SizedBox(
                      height: 20,
                    ),
                    ReviewList(reviews: c.feedbacks),
                  ],
                ),
              ),
            ),
    );
  }
}
