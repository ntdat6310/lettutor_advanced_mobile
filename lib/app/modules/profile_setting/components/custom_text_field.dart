import 'dart:math';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.title = '',
    this.disable = false,
    this.textEditingController,
    this.hintText = '',
    this.suffixIcon,
    this.required = false,
    this.minLines = 1,
    this.maxLines = 20,
    this.topSpacing = 24,
    this.bottomSpacing = 0,
    this.fontSize = 18,
  }) : super(key: key);
  final String title;
  final bool disable;
  final TextEditingController? textEditingController;
  final String hintText;
  final Icon? suffixIcon;
  final bool required;
  final int minLines;
  final int maxLines;
  final double topSpacing;
  final double bottomSpacing;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topSpacing),
        title.isNotEmpty
            ? RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: required ? '* ' : '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        title.isNotEmpty ? const SizedBox(height: 8) : const SizedBox.shrink(),
        TextField(
          controller: textEditingController,
          style: TextStyle(
            fontSize: fontSize,
            color: disable ? Colors.grey : Colors.black,
          ),
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            enabled: !disable,
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
        ),
        SizedBox(height: bottomSpacing),
      ],
    );
  }
}
