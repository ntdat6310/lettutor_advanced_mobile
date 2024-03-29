import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/auth/login_email_request.dart';

import '../models/auth/login_response.dart';
import '../models/auth/register_email_request.dart';
import '../providers/api_provider.dart';

class AuthService {
  Future<int> login({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    int statusCode = 400;
    try {
      dio.Response response = await APIHandlerImp.instance.post(
        body: body,
        endpoint: endpoint,
      );
      if (response.statusCode != null) {
        statusCode = response.statusCode!;
      }
      if (statusCode == 200) {
        Map<String, dynamic> jsonResponse = {
          'accountId': response.data['user']['id'],
          'accessToken': response.data['tokens']['access']['token'],
          'refreshToken': response.data['tokens']['refresh']['token'],
          'accessTokenExpires': response.data['tokens']['access']['expires'],
          'refreshTokenExpires': response.data['tokens']['refresh']['expires'],
        };
        LoginResponseBody body = LoginResponseBody.fromJson(jsonResponse);
        await _storeAllIdentity(body);
      } else {
        debugPrint(
            "LOGIN: FAILED - response.statusCode ${response.statusCode}, ${response.data.toString()}");
      }
    } catch (e) {
      debugPrint("LOGIN: FAILED ${e.toString()}");
    }
    return statusCode;
  }

  Future<int> loginWithEmail({required LoginByEmailRequest body}) async {
    return login(
      endpoint: BackendEnvironment.loginByEmailEndpoint,
      body: body.toJson(),
    );
  }

  Future<int> loginWithGoogle({required Map<String, String> body}) async {
    return login(
      endpoint: BackendEnvironment.loginWithGoogle,
      body: body,
    );
  }

  Future<int> registerByEmail({required RegisterByEmailRequest body}) async {
    try {
      dio.Response response = await APIHandlerImp.instance.post(
          body: body.toJson(),
          endpoint: BackendEnvironment.registerByEmailEndpoint);
      if (response.statusCode == 201) {
        // Success
        return 201;
      } else {
        debugPrint(
            "AuthService.registerByEmail - response.statusCode ${response.statusCode}, ${response.data.toString()}");
      }
    } catch (e) {
      debugPrint("AuthService.registerByEmail ${e.toString()}");
    }
    return 400;
  }

  Future<int> resetPasswordByEmail({required String email}) async {
    try {
      dio.Response response = await APIHandlerImp.instance.post(
        endpoint: BackendEnvironment.resetPasswordByEmail,
        body: {"email": email},
      );
      if (response.statusCode == 200) {
        // Email sent success
        return 200;
      }
      if (response.statusCode == 400) {
        // Email doesn't exist
        return 400;
      }
    } catch (e) {
      debugPrint("AuthService.resetPasswordByEmail ${e.toString()}");
    }
    return 400;
  }

  Future<void> logout() async {
    await GoogleSignInApi.logout();
    APIHandlerImp.instance.reSignIn();
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

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() async {
    return await _googleSignIn.signIn();
  }

  static Future<void> logout() async {
    await _googleSignIn.signOut();
  }
}
