import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/specialties_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_toggle_favorite_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/teachers/components/speciality_list_horizontal.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../../data/models/teacher/teacher.dart';
import '../../../data/services/teacher_service.dart';
import '../../widgets/rating_star.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
    required this.teacher,
    required this.specialtiesController,
    required this.teacherService,
    required this.toggleFavorite,
  }) : super(key: key);

  final Teacher teacher;
  final SpecialtiesController specialtiesController;
  final TeacherService teacherService;
  final Function({required Teacher teacher}) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.TEACHER_DETAIL, arguments: teacher);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(teacher.avatar ??
                            'https://img.freepik.com/free-icon/user_318-804790.jpg?w=2000'),
                        radius: 30,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(4, 0, 0, 4),
                                child: Text(
                                  teacher.name ?? '',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              RatingStar(rating: teacher.rating ?? 0),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: SpecialityListHorizontal(
                                    specialities: specialtiesController
                                        .getSpecialtiesListTeacherCard(
                                            teacher.specialties?.split(',') ??
                                                [])),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    teacher.bio ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              Obx(() => IconButton(
                    icon: Icon(
                      teacher.isFavorite.value == true
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.redAccent,
                      size: 35,
                    ),
                    onPressed: () {
                      toggleFavorite(teacher: teacher);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
