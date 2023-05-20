import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/models/chat/message_ai.dart';

import '../../core/constants/constants.dart';
import '../../data/services/chat_gpt_service.dart';

class ChatWithAiController extends GetxController {
  final ChatGptService _chatGptService = Get.put(ChatGptService());
  RxBool isLoading = false.obs;
  RxList<MessageModel> messages = RxList<MessageModel>([]);
  TextEditingController textController = TextEditingController();

  void _clearInput() {
    textController.clear();
  }

  void enableLoading() {
    isLoading.value = true;
  }

  void _disableLoading() {
    isLoading.value = false;
  }

  void _addUserMessageToList() {
    messages.add(MessageModel.createNew(
      content: textController.text,
      senderType: SenderType.user,
    ));
  }

  void addBotMessageToList(String botMessage) {
    messages.add(
      MessageModel.createNew(
        content: botMessage,
        senderType: SenderType.bot,
      ),
    );
  }

  Future<void> handleButtonSubmitClickWithAllHistory() async {
    _addUserMessageToList();
    _clearInput();
    enableLoading();
    try {
      String botMessage =
          await _chatGptService.fetchChatResponseWithAllHistory(messages);
      _disableLoading();
      if (botMessage.isNotEmpty) {
        addBotMessageToList(botMessage);
      } else {
        addBotMessageToList("an_error_has_occurred_please_try_again".tr);
      }
    } catch (e) {
      _disableLoading();
      addBotMessageToList("an_error_has_occurred_please_try_again".tr);
    }
  }
}
