import 'package:api_ekko/home.endpoint.dart';
import 'package:api_ekko/presentation/endpoints/auth/authenticate_user/authenticate_user.endpoint.dart';
import 'package:api_ekko/presentation/endpoints/auth/recover_password/recover_password.endpoint.dart';
import 'package:api_ekko/presentation/endpoints/user/get_user_info/get_user_info.endpoint.dart';
import 'package:get_server/get_server.dart';

import 'bindings/controllers/authenticate_user.controller.binding.dart';
import 'bindings/controllers/get_user_info.controller.binding.dart';
import 'bindings/controllers/recover_password.controller.binding.dart';
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
      binding: AuthenticateUserControllerBinding(),
    ),
    GetPage(
      name: Routes.RECOVER_PASSWORD,
      method: Method.post,
      page: () => RecoverPasswordEndpoint(),
      binding: RecoverPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.GET_USER_INFO,
      method: Method.get,
      page: () => GetUserInfoEndpoint(),
      binding: GetUserInfoControllerBinding(),
      needAuth: true,
    ),
  ];
}
