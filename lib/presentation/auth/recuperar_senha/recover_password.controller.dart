import 'package:api_ekko/domain/auth/auth.domain.service.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_email.exception.dart';
import 'package:api_ekko/presentation/auth/recuperar_senha/dto/recover_password.response.dart';
import 'package:get_server/get_server.dart';

import 'package:meta/meta.dart';

import 'dto/recover_password.body.dart';

class RecoverPasswordController extends GetxController {
  AuthDomainService _authDomainService;
  RecoverPasswordController({@required AuthDomainService authDomainService}) {
    _authDomainService = authDomainService;
  }

  Future<RecoverPasswordBody> validateBody({
    @required Map<dynamic, dynamic> payload,
  }) async {
    try {
      if (payload == null) throw InvalidBodyException(field: 'payload');

      var body = RecoverPasswordBody.fromJson(payload);
      if (body.email?.isEmpty ?? true) {
        throw InvalidBodyException(field: 'email');
      }

      return body;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> recoverPassword({@required String email}) async {
    await _authDomainService.recoverPassword(email: email);
  }

  RecoverPasswordResponse createResponse() {
    var response = RecoverPasswordResponse(
      success: true,
      data: DataResponse(),
    );

    return response;
  }

  RecoverPasswordResponse createErrorResponse(
    BuildContext context,
    dynamic exception,
  ) {
    String error;
    switch (exception.runtimeType) {
      case InvalidEmailException:
        context.statusCode(404);
        error = 'Nonexistent e-mail';
        break;
      case InvalidBodyException:
        context.statusCode(400);
        error = exception.toString();
        break;
      default:
        context.statusCode(500);
        error = exception.toString();
        break;
    }

    return RecoverPasswordResponse(success: false, error: error);
  }
}
