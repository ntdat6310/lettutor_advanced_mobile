class Review {
  int id;
  int teacherId;
  int studentId;
  String studentName;
  int ratingStar;
  String? comment;
  DateTime date;

  Review({
    required this.id,
    required this.teacherId,
    required this.studentId,
    required this.studentName,
    required this.ratingStar,
    required this.date,
    this.comment,
  });
}
