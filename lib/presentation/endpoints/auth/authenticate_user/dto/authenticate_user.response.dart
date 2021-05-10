import 'package:api_ekko/presentation/data/user.data.dart';
import 'package:api_ekko/presentation/endpoints/auth/data/token.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user.response.g.dart';

@JsonSerializable()
class AuthenticateUserResponse {
  bool success;
  DataResponse? data;
  String? error;

  AuthenticateUserResponse({required this.success, this.data, this.error});

  factory AuthenticateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  final UserData user;
  final TokenData token;
  const DataResponse({required this.user, required this.token});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
