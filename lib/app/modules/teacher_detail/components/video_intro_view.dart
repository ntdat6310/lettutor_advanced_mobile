import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher_detail/components/video_intro_controller.dart';
import 'package:video_player/video_player.dart';

class VideoIntro extends StatefulWidget {
  const VideoIntro({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  State<VideoIntro> createState() => _VideoIntroState();
}

class _VideoIntroState extends State<VideoIntro> {
  late final VideoIntroController videoIntroController;

  @override
  void initState() {
    super.initState();
    videoIntroController = Get.put<VideoIntroController>(VideoIntroController());
    videoIntroController.initValue(url: widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (videoIntroController.isLoading.value) {
        return const CircularProgressIndicator(
          color: Colors.blueAccent,
        );
      } else {
        return SizedBox(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                if (videoIntroController.videoPlayerController != null &&
                    videoIntroController
                        .videoPlayerController!.value.isInitialized)
                  Center(
                    child: AspectRatio(
                      aspectRatio: videoIntroController
                          .videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(
                          videoIntroController.videoPlayerController!),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Obx(() => GestureDetector(
                        onTap: () {
                          videoIntroController.playPauseVideo();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                          child: videoIntroController.isPlaying.value == false
                              ? const Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white,
                                  size: 60,
                                )
                              : const SizedBox.shrink(),
                        ),
                      )),
                ),
              ],
            ));
      }
    });
  }
}
