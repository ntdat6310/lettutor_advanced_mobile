import '../../../core/constants/constants.dart';

class MessageModel  {
  late final DateTime createAt;
  late final String content;
  late final SenderType senderType;

  MessageModel({
    required this.content,
    required this.senderType,
    required this.createAt,
  });

  MessageModel.createNew({
    required this.content,
    required this.senderType,
  }) {
    createAt = DateTime.now();
  }
}