import 'package:api_ekko/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:api_ekko/presentation/endpoints/auth/authenticate_user/authenticate_user.controller.dart';
import 'package:get_server/get_server.dart';

class AuthenticateUserEndpointBinding extends Bindings {
  @override
  void dependencies() {
    var authDomainBinding = AuthDomainBinding();

    Get.lazyPut<AuthenticateUserController>(
      () => AuthenticateUserController(
        authDomainService: authDomainBinding.domain,
      ),
    );
  }
}
