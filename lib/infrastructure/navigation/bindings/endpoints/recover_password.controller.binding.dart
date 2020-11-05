import 'package:api_ekko/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:api_ekko/presentation/endpoints/auth/recover_password/recover_password.controller.dart';
import 'package:get_server/get_server.dart';

class RecoverPasswordControllerBinding extends Bindings {
  @override
  void dependencies() {
    var authDomainBinding = AuthDomainBinding();

    Get.lazyPut<RecoverPasswordController>(
      () => RecoverPasswordController(
        authDomainService: authDomainBinding.domain,
      ),
    );
  }
}
