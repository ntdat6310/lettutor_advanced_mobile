// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      amount: json['amount'] as String?,
      isBlocked: json['isBlocked'] as bool? ?? false,
      bonus: (json['bonus'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
      'bonus': instance.bonus,
    };
