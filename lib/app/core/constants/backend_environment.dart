class BackendEnvironment {
  static String host = "https://sandbox.api.lettutor.com";
  static String refreshTokenEndpoint = "/auth/refresh-token";
  static String loginByEmailEndpoint = '/auth/login';
  static String loginWithGoogle = '/auth/google';
  static String registerByEmailEndpoint = '/auth/register';
  static String getListTutorWithSearchAndFilterAndPagination = '/tutor/search';
  static String toggleFavoriteTutor = '/user/manageFavoriteTutor';
  static String urlFetchChatGPTResponse = 'https://api.openai.com/v1/chat/completions';
  static String getFeedbacksByTeacherId({required String teacherId}) {
    return '/feedback/v2/$teacherId';
  }
  static String getListCourseWithSearchAndFilterAndPagination = '/course';
  static String resetPasswordByEmail = '/user/forgotPassword';
  static String updateProfile = '/user/info';
  static String getProfile = '/user/info';
  static String getTestPreparation = '/test-preparation';
  static String uploadAvatar = '/user/uploadAvatar';
  static String getSchedulesBooked = '/booking/list/student';
  static String getUpcomingSchedule = '/booking/next';
  static String cancelBooking = '/booking/schedule-detail';
  static String cancelReasons = '/booking/cancel-reason';
  static String getSchedulesToBookByTutorId = '/schedule';
  static String bookASchedule = '/booking';
  static String getTotalTime = '/call/total';
  static String getCourseCategory = '/content-category';
  static String reportTeacher = '/report';

  static Map<String, String> specialties = {
    'all': 'All',
    'business-english': 'Business',
    'conversational-english': 'Conversational',
    'english-for-kids': 'Kids',
    'ielts': 'Ielts',
    'starters': 'Starters,',
    'movers': 'Movers',
    'flyers': 'Flyers',
    'ket': 'Ket',
    'pet': 'Pet',
    'toefl': 'Toefl',
    'toeic': 'Toeic'
  };
}
