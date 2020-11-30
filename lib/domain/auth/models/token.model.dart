import 'package:api_ekko/presentation/endpoints/auth/data/token.data.dart';
import 'package:meta/meta.dart';

class TokenModel {
  final String token;
  final DateTime expiration;

  const TokenModel({@required this.token, @required this.expiration});

  TokenData toData() {
    return TokenData(token: token, expiration: expiration);
  }
}
