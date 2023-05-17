import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/backend_environment.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/test_preparation.dart';
import 'package:lettutor_advanced_mobile/app/data/providers/api_provider.dart';

import '../models/profile/profile.dart';
import '../models/profile/wallet.dart';

class ProfileService {
  Future<Profile?> getProfile() async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getProfile,
        useToken: true,
      );
      if (response.statusCode == 200) {
        Profile result = Profile.fromJson(response.data['user']);
        debugPrint("ProfileService.getProfile: ${result.toJson().toString()}");
        return result;
      }
    } catch (e) {
      debugPrint("ProfileService.getProfile: ${e.toString()}");
    }
    return null;
  }

  Future<List<TestPreparation>> getAllTestPreparations() async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getTestPreparation,
      );
      if (response.statusCode == 200) {
        List<dynamic> testPreparationJsons = response.data;
        List<TestPreparation> results =
            testPreparationJsons.map<TestPreparation>((testPreparationJson) {
          return TestPreparation.fromJson(testPreparationJson);
        }).toList();
        return results;
      }
    } catch (e) {
      debugPrint("ProfileService.getTestPreparations: ${e.toString()}");
    }
    return [];
  }

  Future<int?> updateProfile({required Map<String, dynamic> body}) async {
    try {
      dio.Response response = await APIHandlerImp.instance.put(
        endpoint: BackendEnvironment.updateProfile,
        body: body,
        useToken: true,
      );
      if (response.statusCode == 200) {
        return 200;
      } else {
        debugPrint(
            "ProfileService.updateProfile failed with statusCode: ${response.statusCode}");
        return response.statusCode;
      }
    } catch (e) {
      debugPrint("ProfileService.updateProfile: ${e.toString()}");
    }
    return null;
  }

  Future<bool> uploadImage({required String imagePath}) async {
    try {
      String imageName =
          imagePath.substring(imagePath.lastIndexOf("/") + 1, imagePath.length);
      var image = await MultipartFile.fromFile(imagePath, filename: imageName);
      dio.FormData formData = dio.FormData.fromMap({
        "avatar": image,
      });

      debugPrint("CALL API UPLOAD AVATAR...");
      dio.Response response = await APIHandlerImp.instance.postFormData(
        endpoint: BackendEnvironment.uploadAvatar,
        formData: formData,
        useToken: true,
      );
      debugPrint("RESULT UPLOAD AVATAR ${response.statusCode}");
      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint(
            "ProfileService.uploadImage failed with statusCode: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("ProfileService.uploadImage: ${e.toString()}");
    }
    return false;
  }

  Future<Wallet?> getWallet() async {
    try {
      dio.Response response = await APIHandlerImp.instance.get(
        endpoint: BackendEnvironment.getProfile,
        useToken: true,
      );
      if (response.statusCode == 200) {
        return Wallet.fromJson(response.data['user']['walletInfo']);
      } else {
        debugPrint(
            "ProfileService.getWallet failed with statusCode: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("ProfileService.getWallet: ${e.toString()}");
    }
    return null;
  }
}
