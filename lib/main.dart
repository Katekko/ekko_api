import 'package:api_ekko/infrastructure/navigation/navigation.dart';
import 'package:get_server/get_server.dart';
import 'package:logger/logger.dart';

import 'env.dart';

void main(List<String> args) {
  // var parser = ArgParser()..addOption('port', abbr: 'p');
  // var result = parser.parse(args);
  // var portStr = result['port'] ?? Platform.environment['PORT'] ?? '5001';

  var p = int.tryParse('${Env.port}');

  Logger().i('${Env.host}:${Env.port}');
  Logger().wtf(('${Env.jwtKey}'));

  runApp(
    GetServer(
      getPages: Nav.routes,
      host: Env.host,
      port: p,
      jwtKey: Env.jwtKey,
    ),
  );
}
