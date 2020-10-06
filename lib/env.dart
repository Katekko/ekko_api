import 'dart:io';

class Env {
  static final host = Platform.environment['HOST'] ?? '192.168.0.2';
  static final port = Platform.environment['PORT'] ?? '5001';
  static final jwtKey = Platform.environment['jwt-key'] ?? 'S3CR3T';
}
