import 'dart:async';

import 'package:get_server/get_server.dart';

import 'recover_password.controller.dart';

class RecuperarSenhaEndpoint extends GetView<RecoverPasswordController> {
  @override
  FutureOr<Widget> build(BuildContext context) async {
    try {
      var payload = await context.request.payload();
      var body = await controller.validateBody(payload: payload);
      await controller.recoverPassword(email: body.email);
      var response = controller.createResponse();

      return Json(response);
    } catch (err) {
      var errorResponse = controller.createErrorResponse(context, err);
      return Json(errorResponse);
    }
  }
}
