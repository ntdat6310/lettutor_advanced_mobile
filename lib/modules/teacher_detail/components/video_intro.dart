import 'package:flutter/material.dart';

class VideoIntro extends StatelessWidget {
  const VideoIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 200,
      color: Colors.black87,
      child: const Center(
        child: Icon(
          Icons.play_circle_outline,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }
}
