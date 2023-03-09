import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/models/teacher.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/components/speciality_list.dart';
import 'package:lettutor_advanced_mobile/ui/widgets/rating_star.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
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
                              margin: const EdgeInsets.fromLTRB(4,0,0,4),
                              child: Text(
                                teacher.name,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                            const RatingStar(rating: 5),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: SpecialityList(specialities: teacher.specialties),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  teacher.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const Icon(
              Icons.favorite_outline,
              color: Colors.pinkAccent,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
