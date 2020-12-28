import 'package:api_ekko/presentation/endpoints/auth/data/token.data.dart';
import 'package:meta/meta.dart';

class TokenModel {
  final String token;

  const TokenModel({@required this.token});

  TokenData toData() {
    return TokenData(token: token);
  }
}
