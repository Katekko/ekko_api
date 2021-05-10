import 'package:api_ekko/domain/auth/auth.domain.service.dart';
import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:api_ekko/domain/core/exceptions/expired_token.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:api_ekko/domain/core/exceptions/missing_token.exception.dart';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'dto/get_user_info.response.dart';

class GetUserInfoController extends GetxController {
  final AuthDomainService _authDomainService;
  GetUserInfoController({required AuthDomainService authDomainService})
      : _authDomainService = authDomainService;

  Future<Widget> initRequest({Map<dynamic, dynamic>? payload}) async {
    try {
      var user = await _getUserInfo();
      return _createResponse(user: user);
    } catch (err) {
      return _createErrorResponse(err);
    }
  }

  Future<UserModel> _getUserInfo() async {
    try {
      var user = await _authDomainService.getUserInfo();
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Widget _createResponse({required UserModel user}) {
    var response = GetUserInfoResponse(
      success: true,
      data: DataResponse(user: user.toData()),
    );

    return Json(response);
  }

  Widget _createErrorResponse(dynamic exception) {
    String error = 'Fatal Error';
    int status;

    switch (exception.runtimeType) {
      case InvalidBodyException:
        status = 400;
        error = exception.toString();
        break;
      case MissingTokenException:
      case ExpiredTokenException:
      case JwtException:
        status = 401;
        break;
      default:
        status = 500;
        error = exception.toString();
        break;
    }

    return StatusCode(
      statusCode: status,
      child: Json(GetUserInfoResponse(success: false, error: error)),
    );
  }

  final responseData = Rxn<Widget>();
}
