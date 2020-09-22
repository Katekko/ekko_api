import 'package:api_ekko/home.endpoint.dart';
import 'package:api_ekko/infrastructure/navigation/bindings/endpoints/authenticate_user.endpoint.binding.dart';
import 'package:api_ekko/infrastructure/navigation/bindings/endpoints/recover_password.endpoint.binding.dart';
import 'package:api_ekko/presentation/auth/authenticate_user/authenticate_user.endpoint.dart';
import 'package:api_ekko/presentation/auth/recuperar_senha/recover_password.endpoint.dart';
import 'package:get_server/get_server.dart';

import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      method: Method.get,
      page: () => HomeEndpoint(),
    ),
    GetPage(
      name: Routes.LOGIN,
      method: Method.post,
      page: () => AuthenticateUserEndpoint(),
      binding: AuthenticateUserEndpointBinding(),
    ),
    GetPage(
      name: Routes.RECUPERAR_SENHA,
      method: Method.post,
      page: () => RecuperarSenhaEndpoint(),
      binding: RecoverPasswordEndpointBinding(),
    ),
  ];
}
