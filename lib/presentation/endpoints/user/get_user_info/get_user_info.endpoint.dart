import 'package:get_rx/get_rx.dart';
import 'package:get_server/get_server.dart';

import 'get_user_info.controller.dart';

class GetUserInfoEndpoint extends StatefulWidget {
  @override
  _GetUserInfoEndpointState createState() => _GetUserInfoEndpointState();
}

class _GetUserInfoEndpointState extends State<GetUserInfoEndpoint> {
  final GetUserInfoController controller = Get.find();
  final response = Rx<Widget>();

  @override
  Widget build(BuildContext context) {
    context.request.payload().then((payload) async {
      var res = await controller.initRequest(payload);
      response.value = res;
    });

    return Obx(() => response.value == null ? WidgetEmpty() : response.value);
  }
}
