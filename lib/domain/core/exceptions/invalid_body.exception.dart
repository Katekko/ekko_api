import 'package:logger/logger.dart';

class InvalidBodyException implements Exception {
  final String field;
  InvalidBodyException({required this.field}) {
    Logger().w('Invalid Field in payload: $field');
  }

  String toString() => 'Invalid Field in payload: $field';
}
