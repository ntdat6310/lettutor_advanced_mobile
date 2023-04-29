import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/modules/sign_in/sign_in_view.dart';

import '../../core/utils/secure_storage.dart';

enum HttpMethod {
  GET,
  PUT,
  POST,
}

abstract class APIHandlerInterface {
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
    bool useToken = false,
  });

  Future<Response> post({
    required body,
    required String endpoint,
    Map<String, dynamic>? query,
  });

  Future<Response> put({
    var body,
    required String endpoint,
    Map<String, dynamic>? query,
    useToken = false,
  });

  Future<void> storeRefreshToken(String token);
  Future<void> storeAccessToken(String token);
  Future<void> storeIdentity(String token);

  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<String?> getIdentity();
  Future<void> deleteToken();
}

class APIHandlerImp implements APIHandlerInterface {
  static late final String host;
  static late final Dio client;

  static final APIHandlerImp _singleton = APIHandlerImp._internal();
  static APIHandlerImp get instance => _singleton;

  APIHandlerImp._internal() {
    host = BackendEnvironment.host;
    client = Dio();
  }

  factory APIHandlerImp() {
    return _singleton;
  }

  Future<Map<String, String>> _buildHeader({
    bool useToken = false,
    bool useRefreshToken = false,
  }) async {
    var baseHeader = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    if (useToken) {
      String? token =
          useRefreshToken ? await getRefreshToken() : await getAccessToken();
      if (token != "") {
        baseHeader["Authorization"] = "Bearer $token";
      }
    }
    return baseHeader;
  }

  @override
  Future<Response> get({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? query,
    useToken = false,
  }) async {
    Response response = await client.get(host + endpoint,
        queryParameters: query,
        data: jsonEncode(body),
        options: Options(headers: await _buildHeader(useToken: useToken)));

    if (response.statusCode == 401) {
      if (useToken) {
        bool refreshTokenResult = await refreshToken();
        if (refreshTokenResult) {
          Response response = await client.get(host + endpoint,
              queryParameters: query,
              data: jsonEncode(body),
              options:
                  Options(headers: await _buildHeader(useToken: useToken)));
          return response;
        } else {
          // Login again!
          // Nếu ở ngoài mà check có 401 nghĩa là refreshToken failed rồi => Cần login lại...
          return response;
        }
      }
    }
    return response;
  }

  @override
  Future<Response> put({
    body,
    required String endpoint,
    Map<String, dynamic>? query,
    useToken = false,
  }) async {
    Response response = await client.put(
      host + endpoint,
      queryParameters: query,
      data: json.encode(body),
      options: Options(headers: await _buildHeader(useToken: useToken)),
    );

    if (response.statusCode == 401) {
      if (useToken) {
        bool refreshTokenResult = await refreshToken();
        if (refreshTokenResult) {
          Response response = await client.put(
            host + endpoint,
            queryParameters: query,
            data: json.encode(body),
            options: Options(headers: await _buildHeader(useToken: useToken)),
          );
          return response;
        } else {
          // Login again!
          // Nếu ở ngoài mà check có 401 nghĩa là refreshToken failed rồi => Cần login lại...
          return response;
        }
      }
    }
    return response;
  }

  @override
  Future<Response> post({
    required body,
    required String endpoint,
    bool useToken = false,
    Map<String, dynamic>? query,
  }) async {
    Response response = await client.post(
      host + endpoint,
      data: json.encode(body),
      queryParameters: query,
      options: Options(headers: await _buildHeader(useToken: useToken)),
    );
    if (response.statusCode == 401) {
      if (useToken) {
        bool refreshTokenResult = await refreshToken();
        if (refreshTokenResult) {
          Response response = await client.post(
            host + endpoint,
            data: json.encode(body),
            queryParameters: query,
            options: Options(headers: await _buildHeader(useToken: useToken)),
          );
          return response;
        } else {
          // Login again!
          // Nếu ở ngoài mà check có 401 nghĩa là refreshToken failed rồi => Cần login lại...
          return response;
        }
      }
    }
    return response;
  }

  // Chưa check với API
  Future<bool> refreshToken() async {
    final refreshToken = await getRefreshToken();
    var body = {'refreshToken': refreshToken, 'timezone': 7};

    try {
      var response = await post(
          endpoint: BackendEnvironment.refreshTokenEndpoint, body: body);

      if (response.statusCode == 200) {
        await storeAccessToken(response.data['tokens']['access']['token']);
        await storeRefreshToken(response.data['tokens']['refresh']['token']);
        return true;
      } else {
        //  refreshToken expires => Bắt user login lại.
        _reSignIn();
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  void _reSignIn() {
    Get.offAll(SignInView());
  }

  @override
  Future<String?> getAccessToken() async {
    return await SecureStorage.storage.read(key: "accessToken");
  }

  @override
  Future<void> storeAccessToken(String token) async {
    return await SecureStorage.storage.write(key: "accessToken", value: token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await SecureStorage.storage.read(key: "refreshToken");
  }

  @override
  Future<void> storeRefreshToken(String token) async {
    await SecureStorage.storage.write(key: "token", value: token);
  }

  @override
  Future<void> storeIdentity(String id) async {
    await SecureStorage.storage.write(key: "id", value: id);
  }

  @override
  Future<String?> getIdentity() async {
    return SecureStorage.storage.read(key: "id");
  }

  @override
  Future<void> deleteToken() async {
    await SecureStorage.storage.deleteAll();
  }
}
