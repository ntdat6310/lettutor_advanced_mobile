import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CourseLessonController extends GetxController {
  final RxInt selectedTopicIndex = RxInt(-1);
  final RxString fileUrlToShow = ''.obs;
  final PdfViewerController pdfViewerController = PdfViewerController();

  onTopicSelected({required int index, required String fileUrl}) {
    selectedTopicIndex.value = index;
    fileUrlToShow.value = fileUrl;
  }

  void setInitValue({required int index, required String fileUrl}) {
    onTopicSelected(index: index, fileUrl: fileUrl);
  }
}
