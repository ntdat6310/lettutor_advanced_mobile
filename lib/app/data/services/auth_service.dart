import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/login_email_request.dart';

import '../models/login_response.dart';
import '../models/register_email_request.dart';
import '../providers/api_provider.dart';

class AuthService {
  Future<int> login({required LoginByEmailRequest body}) async {
    try {
      Response response =
          await APIHandlerImp.instance.post(body: body, endpoint: 'auth/login');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = {
          'accountId': response.data['user']['id'],
          'accessToken': response.data['tokens']['access']['token'],
          'refreshToken': response.data['tokens']['refresh']['token'],
          'accessTokenExpire': response.data['tokens']['access']['expires'],
          'refreshTokenExpire': response.data['tokens']['refresh']['expires'],
        };
        LoginResponseBody body = LoginResponseBody.fromJson(jsonResponse);
        await _storeAllIdentity(body);
        return 200;
      } else {
        debugPrint(
            "LOGIN: FAILED - response.statusCode ${response.statusCode}, ${response.data.toString()}");
      }
    } catch (e) {
      debugPrint("LOGIN: FAILED ${e.toString()}");
    }
    return 400;
  }

  Future<int> registerByEmail({required RegisterByEmailRequest body}) async{
    try {
      Response response =
      await APIHandlerImp.instance.post(body: body, endpoint: BackendEnvironment.registerByEmailEndpoint);
      if (response.statusCode == 201) {
        // Success
        return 201;
      } else {
        debugPrint(
            "REGISTER BY EMAIL: FAILED - response.statusCode ${response.statusCode}, ${response.data.toString()}");
      }
    } catch (e) {
      debugPrint("REGISTER BY EMAIL: FAILED ${e.toString()}");
    }
    return 400;
  }
}

Future<void> _storeAllIdentity(LoginResponseBody body) async {
  await APIHandlerImp.instance.storeIdentity(body.accountId);
  await APIHandlerImp.instance.storeAccessToken(body.accessToken);
  await APIHandlerImp.instance.storeRefreshToken(body.refreshToken);
  await APIHandlerImp.instance.storeAccessTokenExpires(body.accessTokenExpires);
  await APIHandlerImp.instance
      .storeRefreshTokenExpires(body.refreshTokenExpires);
}
