import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoIntroController extends GetxController {
  VideoPlayerController? videoPlayerController;
  RxBool isPlaying = false.obs;
  RxBool isLoading = true.obs;

  void initValue({required String url}) {
    videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        isLoading.value = false;
      });
  }

  void playPauseVideo() {
    if (videoPlayerController != null &&
        videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController!.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }
}
