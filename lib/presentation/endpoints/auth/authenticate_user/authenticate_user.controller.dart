import 'package:api_ekko/domain/auth/auth.domain.service.dart';
import 'package:api_ekko/domain/auth/models/token.model.dart';
import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:api_ekko/domain/core/exceptions/authentication_failed.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthenticateUserController extends GetxController {
  final AuthDomainService _authDomainService;
  AuthenticateUserController({required AuthDomainService authDomainService})
      : _authDomainService = authDomainService;

  Future<Widget> initRequest(Map<String, dynamic>? payload) async {
    try {
      var body = await _validateBody(payload: payload);

      var user = await _authenticateUser(
        login: body.login!,
        password: body.password!,
      );

      var token = _generateToken(user: user);

      return _createResponse(user: user, token: token);
    } catch (err) {
      return createErrorResponse(err);
    }
  }

  Future<AuthenticateUserBody> _validateBody({
    required Map<String, dynamic>? payload,
  }) async {
    try {
      if (payload != null) {
        var body = AuthenticateUserBody.fromJson(payload);
        if (body.login?.isEmpty ?? true) {
          throw InvalidBodyException(field: 'login');
        } else if (body.password?.isEmpty ?? true) {
          throw InvalidBodyException(field: 'password');
        }

        return body;
      }
      throw InvalidBodyException(field: 'payload');
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> _authenticateUser({
    required String login,
    required String password,
  }) async {
    var user = await _authDomainService.authenticateUser(
      login: login,
      password: password,
    );

    return user;
  }

  String _generateToken({required UserModel user}) {
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

  Widget _createResponse({required UserModel user, required String token}) {
    var tokenModel = TokenModel(token: token);

    var response = AuthenticateUserResponse(
      success: true,
      data: DataResponse(user: user.toData(), token: tokenModel.toData()),
    );

    return Json(response);
  }

  Widget createErrorResponse(dynamic exception) {
    String error;
    int status;
    switch (exception.runtimeType) {
      case InvalidBodyException:
        status = 400;
        error = exception.toString();
        break;
      case AuthenticationFailedException:
        status = 404;
        error = 'User and/or password is wrong';
        break;
      default:
        status = 500;
        error = exception.toString();
        break;
    }

    return StatusCode(
      statusCode: status,
      child: Json(
        AuthenticateUserResponse(success: false, error: error),
      ),
    );
  }

  final responseData = Rxn<Widget>();
}
