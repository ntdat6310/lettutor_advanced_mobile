import 'package:flutter/material.dart';

import '../../../data/models/teacher/teacher.dart';
import '../../widgets/rating_star.dart';

class TeacherBriefInfo extends StatelessWidget {
  const TeacherBriefInfo({Key? key, required this.teacher}) : super(key: key);

  final Teacher teacher;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          CircleAvatar(
            backgroundImage: teacher.avatar != null
                ? NetworkImage(teacher.avatar ?? '')
                : const AssetImage('assets/images/default_user.png')
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
                      teacher.name ?? '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RatingStar(rating: teacher.rating ?? 0),
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 8, 0, 0),
                    child: Text(
                      teacher.country ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
