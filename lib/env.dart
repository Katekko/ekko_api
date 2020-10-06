import 'dart:io';

class Env {
  static final host = '0.0.0.0' ?? '192.168.0.2';
  static final port = Platform.environment['PORT'] ?? '5001';
  static final jwtKey = Platform.environment['JWT_KEY'] ?? 'S3CR3T';
}
