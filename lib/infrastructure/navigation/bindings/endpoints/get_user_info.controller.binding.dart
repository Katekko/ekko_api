import 'package:api_ekko/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:api_ekko/presentation/endpoints/user/get_user_info/get_user_info.controller.dart';
import 'package:get_server/get_server.dart';

class GetUserInfoControllerBinding extends Bindings {
  @override
  void dependencies() {
    var authDomainBinding = AuthDomainBinding();

    Get.lazyPut<GetUserInfoController>(
      () => GetUserInfoController(
        authDomainService: authDomainBinding.domain,
      ),
    );
  }
}
