import 'package:get_server/get_server.dart';

import 'authenticate_user.controller.dart';

class AuthenticateUserEndpoint extends GetView<AuthenticateUserController> {
  @override
  Widget build(BuildContext context) {
    return PayloadWidget(
      builder: (_, payload) {
        controller
            .initRequest(payload as Map<String, dynamic>)
            .then((value) => controller.responseData.value = value);

        return Obx(() => controller.responseData.value ?? WidgetEmpty());
      },
    );
  }
}
