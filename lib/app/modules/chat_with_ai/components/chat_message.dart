import 'package:flutter/material.dart';
import 'dart:core';

import '../../../core/constants/background.dart';
import '../../../core/constants/constants.dart';
import 'code_view.dart';

class ChatMessageWidget extends StatefulWidget {
  const ChatMessageWidget({
    Key? key,
    required this.content,
    required this.senderType,
    required this.messageIndex,
  }) : super(key: key);
  final String content;
  final SenderType senderType;
  final int messageIndex;

  @override
  State<ChatMessageWidget> createState() => _ChatMessageWidgetState();
}

/// If it's odd, it's the code block.
/// Using CodeView to render.
bool _isOdd(int number) {
  return number % 2 != 0;
}

List<String> _replaceDoubleNewline(List<String> strings) {
  return strings.map((string) {
    return string.replaceAll('\n\n', '\n');
  }).toList();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  late final List newContent;

  @override
  void initState() {
    super.initState();
    newContent = _replaceDoubleNewline(widget.content.split("```"));
  }

  Container _buildBotIcon() {
    return Container(
        margin: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/icons/icon_bot.png')),
          ],
        ));
  }

  Container _buildUserIcon() {
    return Container(
        margin: const EdgeInsets.only(right: 12.0),
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/icons/icon_user.png')));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: widget.senderType == SenderType.bot
          ? Background.botBackgroundColor
          : Background.backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.senderType == SenderType.bot
              ? _buildBotIcon()
              : _buildUserIcon(),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(newContent.length, (index) {
                  if (_isOdd(index)) {
                    return CodeViewWidget(code: newContent[index]);
                  } else {
                    return Text(
                      newContent[index],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}
