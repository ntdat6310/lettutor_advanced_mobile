class Course {
  int id = 0;
  String imageUrl;
  String name;
  String shortDesc;
  String level;
  String category;
  String whyTakeThisCourse;
  String whatWillYouBeAbleToDo;
  List<Map<String, String>> topics;

  Course({
    required this.imageUrl,
    required this.name,
    required this.shortDesc,
    required this.level,
    required this.category,
    required this.whatWillYouBeAbleToDo,
    required this.whyTakeThisCourse,
    required this.topics,
  });
}
