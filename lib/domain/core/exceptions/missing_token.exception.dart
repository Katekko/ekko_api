import 'package:logger/logger.dart';

class MissingTokenException implements Exception {
  final String message;
  MissingTokenException({this.message = 'Missing token header'}) {
    Logger().w(message);
  }

  String toString() => '$message';
}
