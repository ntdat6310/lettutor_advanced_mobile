import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course_topic.dart';

class ListTopics extends StatelessWidget {
  const ListTopics({Key? key, required this.topics, required this.style})
      : super(key: key);

  final List<CourseTopic> topics;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(topics.length, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("$index", style: style),
              const SizedBox(width: 10),
              Text(topics[index].name ?? '', style: style)
            ],
          ),
        );
      }),
    );
  }
}
