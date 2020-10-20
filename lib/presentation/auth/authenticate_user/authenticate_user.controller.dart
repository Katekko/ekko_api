import 'package:api_ekko/domain/auth/auth.domain.service.dart';
import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:api_ekko/domain/core/exceptions/authentication_failed.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'package:meta/meta.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthenticateUserController extends GetxController {
  AuthDomainService _authDomainService;
  AuthenticateUserController({@required AuthDomainService authDomainService}) {
    _authDomainService = authDomainService;
  }

  Future<AuthenticateUserBody> validateBody({
    @required Map<dynamic, dynamic> payload,
  }) async {
    try {
      if (payload == null) throw InvalidBodyException(field: 'payload');

      var body = AuthenticateUserBody.fromJson(payload);
      if (body.login?.isEmpty ?? true) {
        throw InvalidBodyException(field: 'login');
      } else if (body.password?.isEmpty ?? true) {
        throw InvalidBodyException(field: 'password');
      }

      return body;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> authenticateUser({
    @required String login,
    @required String password,
  }) async {
    var user = await _authDomainService.authenticateUser(
      login: login,
      password: password,
    );

    return user;
  }

  String generateToken({@required UserModel user}) {
    try {
      final claimSet = JwtClaim(
        subject: user.id.toString(),
        issuer: 'https://gyanburuworld.com/',
        issuedAt: DateTime.now(),
        expiry: DateTime.now().add(Duration(days: 3)),
      );

      var token = TokenUtil.generateToken(claim: claimSet);

      return token;
    } catch (err) {
      rethrow;
    }
  }

  AuthenticateUserResponse createResponse({
    @required UserModel user,
    @required String token,
  }) {
    var response = AuthenticateUserResponse(
      success: true,
      data: DataResponse(user: user.toData(), token: token),
    );

    return response;
  }

  AuthenticateUserResponse createErrorResponse(
    BuildContext context,
    dynamic exception,
  ) {
    String error;
    switch (exception.runtimeType) {
      case InvalidBodyException:
        context.statusCode(400);
        error = exception.toString();
        break;
      case AuthenticationFailedException:
        context.statusCode(404);
        error = 'User and/or password is wrong';
        break;
      default:
        context.statusCode(500);
        error = exception.toString();
        break;
    }

    return AuthenticateUserResponse(success: false, error: error);
  }
}
