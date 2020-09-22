import 'dart:async';

import 'package:get_server/get_server.dart';

class HomeEndpoint extends GetView {
  @override
  FutureOr<Widget> build(BuildContext context) async {
    return Text('Server is online');
  }
}
