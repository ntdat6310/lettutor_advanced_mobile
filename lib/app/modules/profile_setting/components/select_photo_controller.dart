import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor_advanced_mobile/app/data/services/profile_service.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/select_photo_options_view.dart';

class SelectPhotoController extends GetxController {
  final ProfileService _profileService = Get.find<ProfileService>();
  Rx<File?> image = Rx<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    try {
      final imagePickerResult = await ImagePicker().pickImage(source: source);
      if (imagePickerResult == null) {
        return;
      }
      File? newImage = File(imagePickerResult.path);
      newImage = await _cropImage(imageFile: newImage);
      if (newImage != null) {
        image.value = newImage;
        _uploadImage(imagePath: newImage.path);
      }
    } on PlatformException catch (e) {
      debugPrint("pickImage ${e.toString()}");
    }
    Get.back();
  }

  Future<bool> _uploadImage({required String imagePath}) async {
    return await _profileService.uploadImage(imagePath: imagePath);
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsView(
                onTap: pickImage,
              ),
            );
          }),
    );
  }
}
