import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:uuid/uuid.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  final AuthDomainRepository _repository;
  const AuthDomainService({required AuthDomainRepository repository})
      : _repository = repository;

  Future<UserModel> authenticateUser({
    required String login,
    required String password,
  }) {
    try {
      _repository.validateUserPassword(
        login: login,
        password: password,
      );

      return Future.value(
        UserModel(
          id: Uuid().v1(),
          email: 'contato@gyanburuworld.com',
          login: 'Katekko',
          name: 'Guest001',
        ),
      );
    } catch (err) {
      rethrow;
    }
  }

  Future<void> recoverPassword({required String email}) async {
    try {
      _repository.recoverPassword(email: email);
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUserInfo() {
    try {
      return Future.value(
        UserModel(
          id: Uuid().v1(),
          email: 'contato@gyanburuworld.com',
          login: 'Katekko',
          name: 'Guest001',
        ),
      );
    } catch (err) {
      rethrow;
    }
  }
}
