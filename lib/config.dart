import 'dart:io';

class Config {
  static final host =
      Platform.environment['ENV'] == 'prod' ? '0.0.0.0' : '192.168.0.186';
  static final port = Platform.environment['PORT'] ?? '5001';
  static final jwtKey = Platform.environment['JWT_KEY'] ?? 'S3CR3T';
}
