import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'select_photo_button.dart';

class SelectPhotoOptionsView extends StatelessWidget {
  const SelectPhotoOptionsView({Key? key, required this.onTap})
      : super(key: key);
  final Function(ImageSource source) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: 'browse_gallery'.tr,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'or'.tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'use_a_camera'.tr,
            ),
          ])
        ],
      ),
    );
  }
}
