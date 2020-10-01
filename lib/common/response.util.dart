import 'package:api_ekko/domain/core/exceptions/missing_token.exception.dart';
import 'package:get_server/get_server.dart';

abstract class ResponseUtil {
  static bool isTokenValid(BuildContext context) {
    try {
      var token = context.request.header('Authorization');
      print(token);

      throw MissingTokenException();
    } catch (err) {
      rethrow;
    }
  }
}
