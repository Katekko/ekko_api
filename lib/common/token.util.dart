import 'package:api_ekko/domain/auth/models/user.model.dart';
import 'package:api_ekko/domain/core/exceptions/expired_token.exception.dart';
import 'package:api_ekko/domain/core/exceptions/missing_token.exception.dart';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../config.dart';

abstract class TokenUtil {
  static bool isTokenValid(BuildContext context) {
    try {
      dynamic token = context.request.header('Authorization');
      if (token != null) {
        token = token.first;

        if (token.contains('Bearer')) {
          token = token.replaceAll('Bearer ', '');

          final decClaimSet = verifyJwtHS256Signature(token, SECRET);
          if (decClaimSet.expiry.isBefore(DateTime.now())) {
            throw ExpiredTokenException();
          }
        } else {
          throw JwtException.invalidToken;
        }
        return true;
      } else {
        throw MissingTokenException();
      }
    } catch (err) {
      rethrow;
    }
  }

  static String generateToken(UserModel user) {
    try {
      final claimSet = JwtClaim(
        maxAge: const Duration(minutes: 5),
        expiry: DateTime.now().add(Duration(days: 3)),
        subject: user.id.toString(),
        issuer: 'api_ekko',
        issuedAt: DateTime.now(),
      );

      var token = issueJwtHS256(claimSet, SECRET);

      return token;
    } catch (err) {
      rethrow;
    }
  }
}
