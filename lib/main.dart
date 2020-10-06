import 'dart:io';

import 'package:api_ekko/infrastructure/navigation/navigation.dart';
import 'package:get_server/get_server.dart';
import 'package:logger/logger.dart';

final host = Platform.environment['HOST'] ?? '192.168.0.2';
final port = Platform.environment['PORT'] ?? '5001';
final jwtKey = Platform.environment['jwt-key'] ?? 'S3CR3T';

void main(List<String> args) {
  // var parser = ArgParser()..addOption('port', abbr: 'p');
  // var result = parser.parse(args);
  // var portStr = result['port'] ?? Platform.environment['PORT'] ?? '5001';

  var p = int.tryParse(port);

  Logger().i('$host:$port');
  Logger().wtf((jwtKey));

  runApp(GetServer(getPages: Nav.routes, host: host, port: p, jwtKey: jwtKey));
}
