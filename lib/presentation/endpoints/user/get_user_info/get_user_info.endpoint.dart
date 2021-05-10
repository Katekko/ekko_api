import 'package:get_server/get_server.dart';

import 'get_user_info.controller.dart';

class GetUserInfoEndpoint extends StatefulWidget {
  @override
  _GetUserInfoEndpointState createState() => _GetUserInfoEndpointState();
}

class _GetUserInfoEndpointState extends State<GetUserInfoEndpoint> {
  final GetUserInfoController controller = Get.find();
  final response = Rxn<Widget>();

  @override
  Widget build(BuildContext context) {
    controller.initRequest(null).then((value) => response.value = value);
    return Obx(() => response.value ?? WidgetEmpty());
  }
}
