import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/background.dart';
import 'chat_with_ai_controller.dart';
import 'components/chat_message.dart';
import 'components/loading.dart';
import 'components/regenerate_response.dart';

class ChatWithAiView extends GetView<ChatWithAiController> {
  ChatWithAiView({Key? key}) : super(key: key);

  final ChatWithAiController _chatWithAiController =
      Get.put(ChatWithAiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Center(child: Text("GPT - 3.5")),
      ),
      body: SafeArea(
        child: Container(
          color: Background.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: Obx(() => _buildMessageList()),
              ),
              Obx(() => LoadingWidget(
                  isLoading: _chatWithAiController.isLoading.value)),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Background.backgroundColor,
                child: _buildInput(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      decoration: BoxDecoration(
        color: Background.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 0), // Độ lệch của shadow theo trục x, y
          ),
        ],
      ),
      child: Obx(() => TextField(
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(color: Colors.white),
            controller: _chatWithAiController.textController,
            decoration: InputDecoration(
              fillColor: Background.backgroundColor,
              filled: true,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(20),
              isDense: true,
              counterText: "",
              hintText: "Type your message",
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: !_chatWithAiController.isLoading.value
                  ? IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        _chatWithAiController
                            .handleButtonSubmitClickWithAllHistory();
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          )),
    );
  }

  ListView _buildMessageList() {
    return ListView.builder(
      itemCount: _chatWithAiController.messages.length,
      itemBuilder: (context, index) {
        return ChatMessageWidget(
          content: _chatWithAiController.messages[index].content,
          senderType: _chatWithAiController.messages[index].senderType,
          messageIndex: index,
        );
      },
    );
  }
}
