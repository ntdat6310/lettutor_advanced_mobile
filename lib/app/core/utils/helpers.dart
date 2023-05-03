import 'dart:convert';
import 'package:flutter/services.dart';

class Helper {
  static int roundHalfUp(double number) {
    int wholeNumber = number.toInt();
    double fraction = number - wholeNumber;
    if (fraction >= 0.5) {
      return wholeNumber + 1;
    } else {
      return wholeNumber;
    }
  }

  static Future<Map<String, String>> _loadLanguageCodes() async {
    String jsonString =
        await rootBundle.loadString('assets/json/language_codes.json');
    return json.decode(jsonString).cast<String, String>();
  }

  static Future<List<String>> getLanguageNames(String languages) async {
    Map<String, String> languageMap = await _loadLanguageCodes();

    List<String> languageCodes = languages.split(',');
    List<String> languageNames = [];
    for (String code in languageCodes) {
      String name = languageMap[code] ?? 'Unknown';
      languageNames.add(name);
    }
    return languageNames;
  }
}
