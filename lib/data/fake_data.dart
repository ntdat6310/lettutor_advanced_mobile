import 'models/course.dart';
import 'models/review.dart';
import 'models/schedule_history.dart';
import 'models/teacher.dart';
import 'models/schedule.dart';

class FakeData {
  List<Teacher> getTeachers() {
    return [
      Teacher(
          id: 0,
          name: 'April Baldo',
          description:
              "Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.",
          urlAvatar:
              "https://api.app.lettutor.com/avatar/83802576-70fe-4394-b27a-3d9e8b50f1b7avatar1649512219387.jpg",
          urlVideo:
              "https://sandbox.api.lettutor.com/video/f64bca88-80fb-479d-a9d1-66fd326cfa45video1641245785756.mp4",
          country: "Philippines",
          specialties: ["English for Business", "IELTS", "PET", "KET"],
          rating: 5.0,
          experience: "7 years of English tutor.",
          interests: ["Fighting", "Sleeping"],
          languages: ["English", "Japanese"]),
      Teacher(
          id: 1,
          name: 'April Baldo',
          description:
              "Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.",
          urlAvatar:
              "https://api.app.lettutor.com/avatar/83802576-70fe-4394-b27a-3d9e8b50f1b7avatar1649512219387.jpg",
          urlVideo:
              "https://sandbox.api.lettutor.com/video/f64bca88-80fb-479d-a9d1-66fd326cfa45video1641245785756.mp4",
          country: "Philippines",
          specialties: ["English for Business", "IELTS", "PET", "KET"],
          rating: 5.0,
          experience: "7 years of English tutor.",
          interests: ["Fighting", "Sleeping"],
          languages: ["English", "Japanese"]),
      Teacher(
          id: 2,
          name: 'April Baldo',
          description:
              "Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.",
          urlAvatar:
              "https://api.app.lettutor.com/avatar/83802576-70fe-4394-b27a-3d9e8b50f1b7avatar1649512219387.jpg",
          urlVideo:
              "https://sandbox.api.lettutor.com/video/f64bca88-80fb-479d-a9d1-66fd326cfa45video1641245785756.mp4",
          country: "Philippines",
          specialties: ["English for Business", "IELTS", "PET", "KET"],
          rating: 5.0,
          experience: "7 years of English tutor.",
          interests: ["Fighting", "Sleeping"],
          languages: ["English", "Japanese"]),
    ];
  }

  List<Review> getReviews() {
    return [
      Review(
        id: 0,
        studentName: "Nguyễn Thành Đạt",
        teacherId: 0,
        studentId: 0,
        ratingStar: 5,
        date: DateTime.now(),
        comment: "Very good good!",
      ),
      Review(
        id: 0,
        studentName: "Nguyễn Văn A",
        teacherId: 0,
        studentId: 0,
        ratingStar: 3,
        date: DateTime.now(),
        comment: "Very good!",
      ),
      Review(
        id: 0,
        studentName: "Nguyễn Văn B",
        teacherId: 0,
        studentId: 0,
        ratingStar: 4,
        date: DateTime.now(),
        comment: "Very good good good!",
      ),
      Review(
        id: 0,
        studentName: "Nguyễn Thành Đạt",
        teacherId: 0,
        studentId: 0,
        ratingStar: 5,
        date: DateTime.now(),
        comment: "Very good good!",
      ),
    ];
  }

  List<Schedule> getSchedules() {
    return [
      Schedule(
          teacher: FakeData().getTeachers()[0],
          studentId: 0,
          fromTime: DateTime(2023, 3, 13, 15),
          toTime: DateTime(2021, 3, 13, 15, 30)),
      Schedule(
          teacher: FakeData().getTeachers()[0],
          studentId: 0,
          fromTime: DateTime(2023, 3, 14, 16),
          toTime: DateTime(2021, 3, 13, 16, 30)),
      Schedule(
          teacher: FakeData().getTeachers()[0],
          studentId: 0,
          fromTime: DateTime(2023, 3, 15, 17),
          toTime: DateTime(2021, 3, 13, 17, 30)),
      Schedule(
          teacher: FakeData().getTeachers()[0],
          studentId: 0,
          fromTime: DateTime(2023, 3, 16, 18),
          toTime: DateTime(2021, 3, 13, 18, 30)),
    ];
  }

  List<ScheduleHistory> getScheduleHistories() {
    return [
      ScheduleHistory(
          schedule: FakeData().getSchedules()[0], teacherComment: ''),
      ScheduleHistory(
          schedule: FakeData().getSchedules()[1], teacherComment: 'Learn well'),
      ScheduleHistory(
          schedule: FakeData().getSchedules()[2],
          teacherComment: 'A good student'),
      ScheduleHistory(
          schedule: FakeData().getSchedules()[3],
          teacherComment: 'A bad student'),
    ];
  }

  List<Course> getCourses() {
    return [
      Course(
        name: "Basic Conversation",
        imageUrl:
            'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
        shortDesc: "Gain confidence speaking about familiar topics",
        level: "Beginner",
        whyTakeThisCourse:
            "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
        whatWillYouBeAbleToDo:
            "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
        category: 'English For Beginners',
        topics: [
          {'topic': 'Foods You Love', 'pdfPath': 'assets/pdf/topic1.pdf'},
          {'topic': 'Your Job', 'pdfPath': 'assets/pdf/topic2.pdf'},
          {
            'topic': 'Playing and Watching Sports',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'The Best Pet', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {
            'topic': 'Having Fun in Your Free Time',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'Your Daily Routine', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Childhood Memories', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Family Members', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Hometown', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Shopping Habits', 'pdfPath': 'assets/pdf/topic3.pdf'},
        ],
      ),
      Course(
        name: "Basic Conversation 2",
        imageUrl:
            'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
        shortDesc: "Gain confidence speaking about familiar topics",
        level: "Beginner",
        whyTakeThisCourse:
            "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
        whatWillYouBeAbleToDo:
            "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
        category: 'English For Beginners',
        topics: [
          {'topic': 'Foods You Love', 'pdfPath': 'assets/pdf/topic1.pdf'},
          {'topic': 'Your Job', 'pdfPath': 'assets/pdf/topic2.pdf'},
          {
            'topic': 'Playing and Watching Sports',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'The Best Pet', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {
            'topic': 'Having Fun in Your Free Time',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'Your Daily Routine', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Childhood Memories', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Family Members', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Hometown', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Shopping Habits', 'pdfPath': 'assets/pdf/topic3.pdf'},
        ],
      ),
      Course(
        name: "Basic Conversation 3",
        imageUrl:
            'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
        shortDesc: "Gain confidence speaking about familiar topics",
        level: "Beginner",
        whyTakeThisCourse:
            "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
        whatWillYouBeAbleToDo:
            "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
        category: 'English For Beginners',
        topics: [
          {'topic': 'Foods You Love', 'pdfPath': 'assets/pdf/topic1.pdf'},
          {'topic': 'Your Job', 'pdfPath': 'assets/pdf/topic2.pdf'},
          {
            'topic': 'Playing and Watching Sports',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'The Best Pet', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {
            'topic': 'Having Fun in Your Free Time',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'Your Daily Routine', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Childhood Memories', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Family Members', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Hometown', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Shopping Habits', 'pdfPath': 'assets/pdf/topic3.pdf'},
        ],
      ),
      Course(
        name: "Basic Conversation 4",
        imageUrl:
            'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
        shortDesc: "Gain confidence speaking about familiar topics",
        level: "Beginner",
        whyTakeThisCourse:
            "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
        whatWillYouBeAbleToDo:
            "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
        category: 'English For Beginners',
        topics: [
          {'topic': 'Foods You Love', 'pdfPath': 'assets/pdf/topic1.pdf'},
          {'topic': 'Your Job', 'pdfPath': 'assets/pdf/topic2.pdf'},
          {
            'topic': 'Playing and Watching Sports',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'The Best Pet', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {
            'topic': 'Having Fun in Your Free Time',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'Your Daily Routine', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Childhood Memories', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Family Members', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Hometown', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Shopping Habits', 'pdfPath': 'assets/pdf/topic3.pdf'},
        ],
      ),
      Course(
        name: "Basic Conversation 5",
        imageUrl:
            'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
        shortDesc: "Gain confidence speaking about familiar topics",
        level: "Beginner",
        whyTakeThisCourse:
            "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
        whatWillYouBeAbleToDo:
            "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
        category: 'English For Beginners',
        topics: [
          {'topic': 'Foods You Love', 'pdfPath': 'assets/pdf/topic1.pdf'},
          {'topic': 'Your Job', 'pdfPath': 'assets/pdf/topic2.pdf'},
          {
            'topic': 'Playing and Watching Sports',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'The Best Pet', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {
            'topic': 'Having Fun in Your Free Time',
            'pdfPath': 'assets/pdf/topic3.pdf'
          },
          {'topic': 'Your Daily Routine', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Childhood Memories', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Family Members', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Your Hometown', 'pdfPath': 'assets/pdf/topic3.pdf'},
          {'topic': 'Shopping Habits', 'pdfPath': 'assets/pdf/topic3.pdf'},
        ],
      ),
    ];
  }
}
