import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher/components/speciality_list_horizontal.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher/teacher_controller.dart';

import '../../widgets/rating_star.dart';

class TeacherCard extends StatelessWidget {
  TeacherCard({
    Key? key,
    required this.teacherId,
    this.isFavoriteTeacherList = false,
  }) : super(key: key);
  final String teacherId;
  final bool isFavoriteTeacherList;
  final TeacherController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isFavoriteTeacherList &&
          c.getTeacherById(id: teacherId)?.isFavorite.value == false) {
        return const SizedBox.shrink();
      } else {
        return GestureDetector(
          onTap: () {
            debugPrint("TeacherCard onTap");
            // Navigate to TeacherDetail
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
                            backgroundImage: NetworkImage(c
                                    .getTeacherById(id: teacherId)
                                    ?.avatar ??
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
                                    margin:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 4),
                                    child: Text(
                                      c.getTeacherById(id: teacherId)?.name ??
                                          '',
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  RatingStar(
                                      rating: c
                                              .getTeacherById(id: teacherId)
                                              ?.rating ??
                                          0),
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    child: SpecialityListHorizontal(
                                        specialitiesStr: c
                                                .getTeacherById(id: teacherId)
                                                ?.specialties ??
                                            ''),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        c.getTeacherById(id: teacherId)?.bio ?? '',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      c.getTeacherById(id: teacherId)?.isFavorite.value == true
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.redAccent,
                      size: 35,
                    ),
                    onPressed: () {
                      debugPrint("TeacherCard IconButton onClicked");
                      c.toggleFavoriteTeacher(teacherId);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
