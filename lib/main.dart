// import 'package:flutter/material.dart';
// import 'package:lettutor_advanced_mobile/ui/pages/sign_in_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: '1-on-1 Learning App',
//       home: SignInPage(),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/ui/pages/sign_in/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sign In Page',
      home: SignInPage(),
    );
  }
}
