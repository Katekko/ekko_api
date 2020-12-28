import 'package:get_rx/get_rx.dart';
import 'package:get_server/get_server.dart';

import 'authenticate_user.controller.dart';

class AuthenticateUserEndpoint extends StatefulWidget {
  @override
  _AuthenticateUserEndpointState createState() =>
      _AuthenticateUserEndpointState();
}

class _AuthenticateUserEndpointState extends State<AuthenticateUserEndpoint> {
  final AuthenticateUserController controller = Get.find();
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
