import 'dart:async';

import 'package:api_ekko/presentation/auth/authenticate_user/authenticate_user.controller.dart';
import 'package:get_server/get_server.dart';

class AuthenticateUserEndpoint extends GetView<AuthenticateUserController> {
  @override
  FutureOr<Widget> build(BuildContext context) async {
    context.response.type('application/json');
    try {
      var payload = await context.request.payload();

      var body = await controller.validateBody(payload: payload);

      var user = await controller.authenticateUser(
        login: body.login,
        password: body.password,
      );

      var response = controller.createResponse(user: user);

      return Json(response);
    } catch (err) {
      var errorResponse = controller.createErrorResponse(context, err);
      return Json(errorResponse);
    }
  }
}
