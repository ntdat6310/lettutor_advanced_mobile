class Teacher {
  int id = 0;
  String name;
  String? urlAvatar;
  String? urlVideo;
  String description;
  String? country;
  List<String> languages;
  List<String> specialties;
  List<String> interests;
  String? experience;
  double? rating;

  Teacher({
    required this.id,
    required this.name,
    this.urlAvatar,
    this.urlVideo,
    this.country,
    required this.description,
    required this.languages,
    required this.specialties,
    required this.interests,
    this.experience,
    this.rating = 0,
  });

  // Teacher.getDefault() {
  //   id = 0;
  //   name = "April Baldo";
  //   urlAvatar =
  //       "https://api.app.lettutor.com/avatar/83802576-70fe-4394-b27a-3d9e8b50f1b7avatar1649512219387.jpg";
  //   urlVideo =
  //       "https://sandbox.api.lettutor.com/video/f64bca88-80fb-479d-a9d1-66fd326cfa45video1641245785756.mp4";
  //   country = "Philippines";
  //   description =
  //       "Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.";
  //   languages = ["English", "Japanese"];
  //   specialties = ["English for Business", "IELTS", "PET", "KET"];
  //   interests = "Fighting";
  //   experience = "7 years of English tutor";
  //   rating = 4.0;
  // }


}
