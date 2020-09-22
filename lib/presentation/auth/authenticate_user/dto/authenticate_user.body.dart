import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user.body.g.dart';

@JsonSerializable()
class AuthenticateUserBody {
  String login;
  String password;

  AuthenticateUserBody({String login, String password}) {
    this.login = login;
    this.password = password;
  }

  factory AuthenticateUserBody.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserBodyToJson(this);
}
