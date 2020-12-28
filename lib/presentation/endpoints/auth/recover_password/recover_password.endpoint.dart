import 'package:get_rx/get_rx.dart';
import 'package:get_server/get_server.dart';

import 'recover_password.controller.dart';

class RecoverPasswordEndpoint extends StatefulWidget {
  @override
  _RecoverPasswordEndpointState createState() =>
      _RecoverPasswordEndpointState();
}

class _RecoverPasswordEndpointState extends State<RecoverPasswordEndpoint> {
  final RecoverPasswordController controller = Get.find();
  final response = Rx<Widget>();

  @override
  Widget build(BuildContext context) {
    return PayloadWidget(
      builder: (_, payload) {
        controller.initRequest(payload).then((value) => response.value = value);

        return Obx(
          () => response.value == null ? WidgetEmpty() : response.value,
        );
      },
    );
  }
}
