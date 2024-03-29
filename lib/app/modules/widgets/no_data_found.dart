import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://cdn.iconscout.com/icon/free/png-256/free-data-not-found-1965034-1662569.png?f=webp&w=256',
          height: 150,
        ),
        Text(
          'no_data_found'.tr,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
