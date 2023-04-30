import 'package:json_annotation/json_annotation.dart';

part 'login_email_request.g.dart';

@JsonSerializable()
class LoginByEmailRequest {
  final String email;
  final String password;

  LoginByEmailRequest({
    required this.email,
    required this.password,
  });

  factory LoginByEmailRequest.fromJson(Map<String, dynamic> json)
  => _$LoginByEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByEmailRequestToJson(this);
}
