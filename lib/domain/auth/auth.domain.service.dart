import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:meta/meta.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  AuthDomainRepository _authDomainRepository;
  AuthDomainService({AuthDomainRepository authDomainRepository}) {
    _authDomainRepository = authDomainRepository;
  }

  Future<UserModel> authenticateUser({String login, String password}) {
    try {
      _authDomainRepository.validateUserPassword(
        login: login,
        password: password,
      );

      return Future.value(
        UserModel(
          id: 1,
          email: 'contato@gyanburuworld.com',
          name: 'Katekko',
        ),
      );
    } catch (err) {
      rethrow;
    }
  }

  void recoverPassword({@required String email}) {
    try {
      _authDomainRepository.recoverPassword(email: email);
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUserInfo() {
    try {
      return Future.value(
        UserModel(
          id: 1,
          email: 'contato@gyanburuworld.com',
          name: 'Katekko',
        ),
      );
    } catch (err) {
      rethrow;
    }
  }
}
