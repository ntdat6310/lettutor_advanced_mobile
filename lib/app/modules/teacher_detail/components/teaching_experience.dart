import 'package:flutter/material.dart';

class SectionWithTitleAndContent extends StatelessWidget {
  const SectionWithTitleAndContent(
      {Key? key, required this.content, required this.title})
      : super(key: key);

  final String title;
  final String content;
  final TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  final TextStyle teachingExperienceStyle = const TextStyle(
    fontSize: 17,
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.start,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(12, 10, 0, 0),
          child: Text(
            content,
            style: teachingExperienceStyle,
          ),
        )
      ],
    );
  }
}
