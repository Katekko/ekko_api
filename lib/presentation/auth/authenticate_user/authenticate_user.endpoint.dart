import 'dart:async';

import 'package:api_ekko/jwt_key.dart';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:get_server/src/core/utils/token_util.dart';

import 'authenticate_user.controller.dart';

class AuthenticateUserEndpoint extends GetView<AuthenticateUserController> {
  @override
  FutureOr<Widget> build(BuildContext context) async {
    try {
      var payload = await context.request.payload();

      var body = await controller.validateBody(payload: payload);

      var user = await controller.authenticateUser(
        login: body.login,
        password: body.password,
      );

      final claimSet = JwtClaim(
        maxAge: const Duration(minutes: 5),
        expiry: DateTime.now().add(Duration(days: 3)),
        subject: user.id.toString(),
        issuer: 'api_ekko',
        issuedAt: DateTime.now(),
      );

      var token = TokenUtil.generateToken(claim: claimSet, jwtKey: JWT_KEY);

      var response = controller.createResponse(user: user, token: token);

      return Json(response);
    } catch (err) {
      var errorResponse = controller.createErrorResponse(context, err);
      return Json(errorResponse);
    }
  }
}
