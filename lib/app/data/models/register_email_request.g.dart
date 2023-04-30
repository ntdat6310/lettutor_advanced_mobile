// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterByEmailRequest _$RegisterByEmailRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterByEmailRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterByEmailRequestToJson(
        RegisterByEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
