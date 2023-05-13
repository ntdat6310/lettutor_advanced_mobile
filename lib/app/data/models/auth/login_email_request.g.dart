// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginByEmailRequest _$LoginByEmailRequestFromJson(Map<String, dynamic> json) =>
    LoginByEmailRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginByEmailRequestToJson(
        LoginByEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
