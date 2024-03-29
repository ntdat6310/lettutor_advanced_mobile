import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';

import '../controllers/specialties_controller.dart';
import '../controllers/teachers_and_home_controller.dart';

class TeachersController extends GetxController {
  static const _pageSize = 12;
  final PagingController<int, Teacher> _pagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, Teacher> get pagingController => _pagingController;
  final TeacherService teacherService = Get.put(TeacherService());

  final SpecialtiesController specialtiesController =
      Get.put<SpecialtiesController>(
    SpecialtiesController(),
    tag: "TEACHERS",
  );
  String searchKey = '';
  RxString nationalityKey = 'ANY_NATIONALITY'.obs;

  void updateSearch({required String newValue}) {
    searchKey = newValue;
    _pagingController.refresh();
  }

  void updateNationality({String? newValue}) {
    if (newValue != null) {
      nationalityKey.value = newValue;
      _pagingController.refresh();
    }
  }

  void updateSpecialty({required String key}) async {
    specialtiesController.selectItem(key);
    _pagingController.refresh();
  }

  void toggleFavorite({required Teacher teacher}) async {
    await teacherService.toggleFavoriteTutor(tutorId: teacher.userId!);
    TeachersAndHomeController teachersAndHomeController = Get.find();
    teachersAndHomeController.refreshAll();
  }

  void refreshTeachers() {
    _pagingController.refresh();
  }

  @override
  void onInit() async {
    super.onInit();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<String> specialties = specialtiesController.getSelectedSpecialties();
      final newItems =
          await teacherService.getListTutorWithSearchAndFilterAndPagination(
        page: pageKey,
        perPage: _pageSize,
        searchKey: searchKey,
        specialties: specialties.isEmpty ? null : specialties,
        nationalityKey: nationalityKey.value,
      );
      teacherService.sortTeachersByFavoriteAndRating(teachers: newItems);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void onClose() {
    _pagingController.dispose();
    super.onClose();
  }
}
