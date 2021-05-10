import 'package:api_ekko/domain/auth/auth.domain.service.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_email.exception.dart';
import 'package:get_server/get_server.dart';

import 'dto/recover_password.body.dart';
import 'dto/recover_password.response.dart';

class RecoverPasswordController extends GetxController {
  final AuthDomainService _authDomainService;
  RecoverPasswordController({required AuthDomainService authDomainService})
      : _authDomainService = authDomainService;

  Future<Widget> initRequest(Map<String, dynamic>? payload) async {
    try {
      var body = await _validateBody(payload: payload);
      await _recoverPassword(email: body.email!);
      return _createResponse();
    } catch (err) {
      return _createErrorResponse(err);
    }
  }

  Future<RecoverPasswordBody> _validateBody({
    required Map<String, dynamic>? payload,
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

  Future<void> _recoverPassword({required String email}) async {
    await _authDomainService.recoverPassword(email: email);
  }

  Widget _createResponse() {
    var response = RecoverPasswordResponse(success: true, data: DataResponse());
    return Json(response);
  }

  Widget _createErrorResponse(dynamic exception) {
    String error;
    int status;
    switch (exception.runtimeType) {
      case InvalidBodyException:
        status = 400;
        error = exception.toString();
        break;
      case InvalidEmailException:
        status = 404;
        error = 'Nonexistent e-mail';
        break;
      default:
        status = 500;
        error = exception.toString();
        break;
    }

    return StatusCode(
      statusCode: status,
      child: Json(RecoverPasswordResponse(success: false, error: error)),
    );
  }
}
