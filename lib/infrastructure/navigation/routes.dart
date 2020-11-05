class Controllers {
  static const AUTH = '/api/auth';
  static const USER = '/api/user';
}

class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static const HOME = '/';
  static const LOGIN = '${Controllers.AUTH}/login';
  static const RECOVER_PASSWORD = '${Controllers.AUTH}/recover-password';
  static const GET_USER_INFO = '${Controllers.USER}';
}
