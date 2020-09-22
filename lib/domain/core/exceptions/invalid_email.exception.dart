import 'package:logger/logger.dart';

class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException({this.message = 'Invalid E-mail'}) {
    Logger().w(message);
  }

  String toString() => '$message';
}
