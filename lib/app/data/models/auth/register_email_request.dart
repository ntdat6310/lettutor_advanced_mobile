import 'package:json_annotation/json_annotation.dart';

part 'register_email_request.g.dart';

@JsonSerializable()
class RegisterByEmailRequest {
  final String email;
  final String password;

  RegisterByEmailRequest({
    required this.email,
    required this.password,
  });

  factory RegisterByEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterByEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterByEmailRequestToJson(this);
}
