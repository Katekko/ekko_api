import 'package:api_ekko/home.endpoint.dart';
import 'package:api_ekko/infrastructure/navigation/bindings/endpoints/authenticate_user.endpoint.binding.dart';
import 'package:api_ekko/infrastructure/navigation/bindings/endpoints/recover_password.endpoint.binding.dart';
import 'package:api_ekko/presentation/auth/authenticate_user/authenticate_user.endpoint.dart';
import 'package:api_ekko/presentation/auth/recover_password/recover_password.endpoint.dart';
import 'package:api_ekko/presentation/user/get_user_info/get_user_info.endpoint.dart';
import 'package:get_server/get_server.dart';

import 'bindings/endpoints/get_user_info.endpoint.binding.dart';
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
      name: Routes.RECOVER_PASSWORD,
      method: Method.post,
      page: () => RecuperarSenhaEndpoint(),
      binding: RecoverPasswordEndpointBinding(),
    ),
    GetPage(
      name: Routes.GET_USER_INFO,
      method: Method.get,
      page: () => GetUserInfoEndpoint(),
      binding: GetUserInfoEndpointBinding(),
    ),
  ];
}
