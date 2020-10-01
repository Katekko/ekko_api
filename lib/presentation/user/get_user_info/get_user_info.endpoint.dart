import 'dart:async';

import 'package:api_ekko/common/token.util.dart';
import 'package:get_server/get_server.dart';

import 'get_user_info.controller.dart';

class GetUserInfoEndpoint extends GetView<GetUserInfoController> {
  @override
  FutureOr<Widget> build(BuildContext context) async {
    context.response.type('application/json');
    try {
      TokenUtil.isTokenValid(context);
      var user = await controller.getUserInfo();
      var response = controller.createResponse(user: user);
      return Json(response);
    } catch (err) {
      var errorResponse = controller.createErrorResponse(context, err);
      return Json(errorResponse);
    }
  }
}
