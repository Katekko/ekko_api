class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static const HOME = '/';
  static const LOGIN = '/api/auth/login';
  static const recover_password = '/api/auth/recover-password';
}
