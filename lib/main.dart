import 'package:api_ekko/infrastructure/navigation/navigation.dart';
import 'package:get_server/get_server.dart';
import 'package:logger/logger.dart';

import 'config.dart';

void main() {
  var p = int.tryParse('${Config.port}');
  Logger().i('${Config.host}:${Config.port}');

  runApp(
    GetServer(
      getPages: Nav.routes,
      host: Config.host,
      port: p,
      jwtKey: Config.jwtKey,
    ),
  );
}
