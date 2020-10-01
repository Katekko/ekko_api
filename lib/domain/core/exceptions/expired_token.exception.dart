import 'package:logger/logger.dart';

class ExpiredTokenException implements Exception {
  final String message;
  ExpiredTokenException({this.message = 'Token expired'}) {
    Logger().w(message);
  }

  String toString() => '$message';
}
