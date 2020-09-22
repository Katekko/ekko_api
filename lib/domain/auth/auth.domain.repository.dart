import 'package:api_ekko/domain/core/exceptions/authentication_failed.exception.dart';
import 'package:api_ekko/domain/core/exceptions/invalid_email.exception.dart';
import 'package:meta/meta.dart';

class AuthDomainRepository {
  bool validateUserPassword({
    @required String login,
    @required String password,
  }) {
    try {
      if (login == 'contato@gyanburuworld.com' && password == '123456') {
        return true;
      } else {
        throw AuthenticationFailedException();
      }
    } catch (err) {
      rethrow;
    }
  }

  void recoverPassword({@required String email}) {
    try {
      if (email != 'contato@gyanburuworld.com') {
        throw InvalidEmailException();
      }
    } catch (err) {
      rethrow;
    }
  }
}
