import 'package:api_ekko/domain/auth/auth.domain.repository.dart';
import 'package:api_ekko/domain/auth/auth.domain.service.dart';

class AuthDomainBinding {
  late AuthDomainService _authDomainService;
  AuthDomainService get domain => _authDomainService;

  AuthDomainBinding() {
    var authDomainRepository = AuthDomainRepository();
    _authDomainService = AuthDomainService(repository: authDomainRepository);
  }
}
