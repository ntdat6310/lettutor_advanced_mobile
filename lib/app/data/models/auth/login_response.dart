import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String accountId;
  final String accessToken;
  final String refreshToken;
  final String accessTokenExpires;
  final String refreshTokenExpires;

  LoginResponseBody({
    required this.accountId,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpires,
    required this.refreshTokenExpires,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json)
  => _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);

}
