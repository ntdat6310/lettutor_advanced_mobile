class BackendEnvironment {
  static String host = "https://sandbox.api.lettutor.com";
  static String refreshTokenEndpoint = "/auth/refresh-token";
  static String loginByEmailEndpoint = '/auth/login';
  static String registerByEmailEndpoint = '/auth/register';
  static String getListTutorWithSearchAndFilterAndPagination = '/tutor/search';
  static String toggleFavoriteTutor = '/user/manageFavoriteTutor';
  static String getFeedbacksByTeacherId({required String teacherId}) {
    return 'feedback/v2/$teacherId';
  }

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
