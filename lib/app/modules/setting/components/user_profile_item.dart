import 'package:flutter/material.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({Key? key}) : super(key: key);

  final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black,
  );

  final TextStyle emailStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Màu của shadow, có độ mờ
            spreadRadius: 1, // Khoảng cách giãn của shadow
            blurRadius: 5, // Độ mờ của shadow
            offset: const Offset(0, 0), // Độ lệch của shadow theo trục x, y
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/800px-User_icon_2.svg.png"),
            radius: 40,
          ),
          const SizedBox(height: 8),
          Text(
            "Danilo Tanic",
            style: nameStyle,
          ),
          const SizedBox(height: 4),

          Text(
            "danilo@uscreen.tv",
            style: emailStyle,
          ),
          const SizedBox(height: 8),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Edit profile'),
                SizedBox(width: 5),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
