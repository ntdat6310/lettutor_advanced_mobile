import 'dart:ui';

import 'package:get/get.dart';

import '../locales/st_en_us.dart';
import '../locales/st_vi_vn.dart';

class LocalizationService extends Translations {
  // locale sẽ được get mỗi khi mới mở app
  // (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

  // fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const fallbackLocale = Locale('en', 'US');

  // Các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  // Dùng để đổ data vào Dropdownbutton
  static const Map<String, String> languagesSupport = {
    'en': 'English',
    'vi': 'Tiếng Việt',
  };

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    String? lang = langCode ?? Get.deviceLocale?.languageCode;
    for (var locale in locales) {
      if (lang == locale.languageCode) {
        return locale;
      }
    }
    return Get.locale ?? fallbackLocale;
  }
}
