import 'package:get/get.dart';

class CourseLessonController extends GetxController {
  //TODO: Implement CourseLessonController

  var selectedTopicIndex = -1.obs;

  onTopicSelected(int index){
    selectedTopicIndex = index;
  }
}
