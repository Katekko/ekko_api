import 'package:logger/logger.dart';

class AuthenticationFailedException implements Exception {
  final String message;
  AuthenticationFailedException({this.message = 'Authentication failed'}) {
    Logger().w(message);
  }

  String toString() => '$message';
}
