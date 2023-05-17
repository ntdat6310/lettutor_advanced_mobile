import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  String? amount;
  bool isBlocked;
  late double bonus;

  Wallet({
    required this.amount,
    this.isBlocked = false,
    this.bonus = 0,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);

  String get getFormatBalance {
    final formatCurrency = NumberFormat('#,###', 'vi_VN');
    return formatCurrency.format(int.parse(amount ?? '0'));
  }
}
