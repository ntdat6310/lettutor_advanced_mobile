import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

import '../../core/constants/constants.dart';
import '../models/chat/message_ai.dart';

// Follow OpenAI's document
// https://platform.openai.com/docs/guides/chat/introduction
// https://platform.openai.com/docs/api-reference/chat
class ChatGptService {
  Future<String> fetchChatResponseWithAllHistory(
    List<MessageModel> messages,
  ) async {
    final newMessages =
        List<Map<String, dynamic>>.generate(messages.length, (index) {
      return {
        "role": messages[index].senderType == SenderType.user
            ? "user"
            : "assistant",
        "content": messages[index].content,
      };
    });

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": newMessages,
      'temperature': 0,
      'max_tokens': 1000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    };

    try {
      dio.Response response = await APIHandlerImp.instance.postChatGPT(
        body: body,
        url: BackendEnvironment.urlFetchChatGPTResponse,
      );

      // Response success
      if (response.statusCode == 200) {
        print("-----------------------");
        print(response.data.toString());
        // This format is follow by OpenAI's document
        return response.data['choices'][0]['message']['content'];
      } else {
        // Response Failed
        debugPrint(
            "ChatGPTService.fetchChatResponseWithAllHistory failed with status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint(
          "ChatGPTService.fetchChatResponseWithAllHistory error ${e.toString()}");
    }
    return '';
  }
}
