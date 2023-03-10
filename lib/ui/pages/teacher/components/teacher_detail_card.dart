import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/components/speciality_list.dart';

import '../../../../data/models/teacher.dart';
import '../../../widgets/rating_star.dart';

class TeacherDetailCard extends StatelessWidget {
  const TeacherDetailCard({Key? key, required this.teacher}) : super(key: key);

  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
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
      ),
    );
  }
}
