import 'package:flutter/material.dart';

class TeachingExperience extends StatelessWidget {
  const TeachingExperience(
      {Key? key, required this.teachingExperience})
      : super(key: key);

  final String? teachingExperience;
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
          "Teaching experience",
          style: titleStyle,
          textAlign: TextAlign.start,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(12, 10, 0, 0),
          child: Text(
            teachingExperience ?? "No experience.",
            style: teachingExperienceStyle,
          ),
        )
      ],
    );
  }
}
