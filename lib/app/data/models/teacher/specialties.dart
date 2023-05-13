import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Specialties {
  String key;
  String value;
  RxBool isSelected;

  Specialties({
    required this.key,
    required this.value,
    bool isSelected = false,
  }) : isSelected = RxBool(isSelected);
}
