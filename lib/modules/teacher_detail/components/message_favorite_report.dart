import 'package:flutter/material.dart';

class MessageFavoriteReport extends StatelessWidget {
  const MessageFavoriteReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: const [
            Icon(
              Icons.message_outlined,
              color: Colors.blueAccent,
              size: 36,
            ),
            Text(
              "Message",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.favorite_outline,
              color: Colors.blueAccent,
              size: 36,
            ),
            Text(
              "Favorite",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
        Column(
          children: const [
            Icon(
              Icons.report_outlined,
              color: Colors.blueAccent,
              size: 36,
            ),
            Text(
              "Report",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
