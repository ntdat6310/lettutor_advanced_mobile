import 'package:flutter/material.dart';


import '../../../data/models/teacher.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/rating_star.dart';
import 'components/booking_button.dart';
import 'components/chip_info.dart';
import 'components/message_favorite_report.dart';
import 'components/review_list.dart';
import 'components/teacher_desc.dart';
import 'components/teaching_experience.dart';
import 'components/video_intro.dart';

class TeacherDetail extends StatelessWidget {
  const TeacherDetail({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "",
      ),
      body: Padding(
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
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
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
                              teacher.name,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const RatingStar(rating: 5),
                          Container(
                            margin: const EdgeInsets.fromLTRB(4, 8, 0, 0),
                            child: const Text(
                              "Vietnam",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const MessageFavoriteReport(),
              ),
              BookingButton(),
              const SizedBox(height: 20),
              const TeacherDescription(),
              ChipInfo(
                title: "Languages",
                chipList: teacher.languages,
              ),
              const SizedBox(
                height: 20,
              ),
              ChipInfo(chipList: teacher.specialties, title: "Specialties"),
              const SizedBox(
                height: 20,
              ),
              ChipInfo(chipList: teacher.interests, title: "Interests"),
              const SizedBox(
                height: 20,
              ),
              TeachingExperience(teachingExperience: teacher.experience),
              const SizedBox(
                height: 20,
              ),
              ReviewList(),
            ],
          ),
        ),
      ),
    );
  }
}
