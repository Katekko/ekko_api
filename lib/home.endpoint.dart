import 'dart:async';

import 'package:get_server/get_server.dart';

import 'infrastructure/navigation/routes.dart';

class HomeEndpoint extends GetView {
  @override
  FutureOr<Widget> build(BuildContext context) async {
    return Text('''Currently these are the endpoints:\n
${Routes.HOME} (here)

POST ${Routes.LOGIN}
  body -> login: String, password: String
  accept -> login: contato@gyanburuworld.com | password: 123456

POST ${Routes.RECOVER_PASSWORD}
  body -> email: String
  accept -> email: contato@gyanburuworld.com

GET ${Routes.GET_USER_INFO}
  Working with JWT Authorization
  obs: to get the info you will need do the login and retrieve the token first
    ''');
  }
}
