class BackendEnvironment {
  static String host = "https://sandbox.api.lettutor.com";
  static String refreshTokenEndpoint = "/auth/refresh-token";
  static String loginByEmailEndpoint = '/auth/login';
  static String registerByEmailEndpoint = '/auth/register';
  static String getListTutorWithSearchAndFilterAndPagination = '/tutor/search';
  static String toggleFavoriteTutor = '/user/manageFavoriteTutor';
  static String getFeedbacksByTeacherId({required String teacherId}){
    return 'feedback/v2/$teacherId';
  }
}
