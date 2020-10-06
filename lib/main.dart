import 'dart:io';

import 'package:api_ekko/infrastructure/navigation/navigation.dart';
import 'package:args/args.dart';
import 'package:get_server/get_server.dart';

import 'config.dart';
import 'jwt_key.dart';

void main(List<String> args) {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '5001';
  var port = int.tryParse(portStr);

  runApp(
    GetServer(
      getPages: Nav.routes,
      host: ConfigEnvironments.getEnvironments()['url'],
      port: port,
      jwtKey: JWT_KEY,
    ),
  );
}
