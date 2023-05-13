import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChipInfo extends StatelessWidget {
  const ChipInfo({Key? key, required this.chipList, required this.title})
      : super(key: key);

  final List<String> chipList;
  final String title;
  final TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
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
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Obx(() => Wrap(
            spacing: 10,
            children: List.generate(
                chipList.length,
                    (index) => Chip(
                  label: Text(chipList[index]),
                  labelStyle: const TextStyle(color: Colors.blue),
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.blue.shade500)),
                )),
          )),
        )
      ],
    );
  }
}
