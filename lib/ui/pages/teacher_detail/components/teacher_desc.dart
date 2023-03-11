import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TeacherDescription extends StatefulWidget {
  const TeacherDescription({Key? key}) : super(key: key);

  @override
  State<TeacherDescription> createState() => _TeacherDescriptionState();
}

class _TeacherDescriptionState extends State<TeacherDescription> {
  bool _isShowFullText = false;

  TextStyle normalStyle = const TextStyle(
    fontSize: 17,
    color: Colors.black54,
  );

  TextStyle toggleStyle = const TextStyle(
    fontSize: 17,
    color: Colors.blueAccent,
  );

  void _toggleText() {
    setState(() {
      _isShowFullText = !_isShowFullText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.",
          maxLines: _isShowFullText ? 1000 : 2,
          overflow: TextOverflow.ellipsis,
          style: normalStyle,
          textAlign: TextAlign.left,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                _toggleText();
              },
              child: Text(
                _isShowFullText ? "Hide" : "Show",
                style: toggleStyle,
              )),
        )
      ],
    );
  }
}
