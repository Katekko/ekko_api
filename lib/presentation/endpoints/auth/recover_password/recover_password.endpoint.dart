import 'package:get_server/get_server.dart';

import 'recover_password.controller.dart';

class RecoverPasswordEndpoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RecoverPasswordController>();

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
