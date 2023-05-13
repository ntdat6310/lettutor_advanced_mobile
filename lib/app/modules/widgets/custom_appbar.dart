import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 5,
      automaticallyImplyLeading: true,
      shadowColor: Colors.black38,
      iconTheme: const IconThemeData(color: Colors.blueAccent),
      title: Text(
        title,
        style: const TextStyle(color: Colors.blue),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
      ],
    );
  }

  // TODO: implement preferredSize
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget? get child => null;
// Note that preferredSize returns the height of the app bar,
// which is defined by the kToolbarHeight constant provided by the Flutter framework.
// The child method returns null because CustomAppBar does not have any child widgets.
}
