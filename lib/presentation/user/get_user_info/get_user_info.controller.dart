import 'package:api_ekko/domain/auth/auth.domain.service.dart';
import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:api_ekko/domain/core/exceptions/expired_token.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:api_ekko/domain/core/exceptions/missing_token.exception.dart';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:meta/meta.dart';

import 'dto/get_user_info.response.dart';

class GetUserInfoController extends GetxController {
  AuthDomainService _authDomainService;
  GetUserInfoController({@required AuthDomainService authDomainService}) {
    _authDomainService = authDomainService;
  }

  Future<UserModel> getUserInfo() async {
    try {
      var user = await _authDomainService.getUserInfo();
      return user;
    } catch (err) {
      rethrow;
    }
  }

  GetUserInfoResponse createResponse({@required UserModel user}) {
    var response = GetUserInfoResponse(
      success: true,
      data: DataResponse(user: user.toData()),
    );

    return response;
  }

  GetUserInfoResponse createErrorResponse(
    BuildContext context,
    dynamic exception,
  ) {
    switch (exception.runtimeType) {
      case InvalidBodyException:
        context.statusCode(400);
        break;
      case MissingTokenException:
      case ExpiredTokenException:
      case JwtException:
        context.statusCode(401);
        break;
      default:
        context.statusCode(500);
        break;
    }

    return GetUserInfoResponse(success: false, error: exception.toString());
  }
}
