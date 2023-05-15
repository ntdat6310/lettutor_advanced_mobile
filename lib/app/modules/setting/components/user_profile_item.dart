import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../../data/models/profile/profile.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({Key? key, this.profile}) : super(key: key);

  final Profile? profile;
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
          CircleAvatar(
            backgroundImage: NetworkImage(profile != null
                ? profile?.avatar ??
                    'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png'
                : "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"),
            radius: 40,
          ),
          const SizedBox(height: 8),
          Text(
            profile != null ? profile!.name! : 'No name',
            style: nameStyle,
          ),
          const SizedBox(height: 4),
          Text(
            profile != null ? profile!.email! : 'No email',
            style: emailStyle,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE_SETTING);
            },
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
