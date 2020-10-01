class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static const HOME = '/';
  static const LOGIN = '/api/auth/login';
  static const RECOVER_PASSWORD = '/api/auth/recover-password';
  static const GET_USER_INFO = '/api/user';
}
