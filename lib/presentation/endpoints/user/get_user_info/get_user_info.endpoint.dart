import 'package:get_server/get_server.dart';

import 'get_user_info.controller.dart';

class GetUserInfoEndpoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetUserInfoController>();

    controller
        .initRequest()
        .then((value) => controller.responseData.value = value);

    return Obx(() => controller.responseData.value ?? WidgetEmpty());
  }
}
