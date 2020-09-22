import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user.response.g.dart';

@JsonSerializable()
class AuthenticateUserResponse {
  bool success;
  DataResponse data;
  String error;

  AuthenticateUserResponse({this.success, this.data, this.error});

  factory AuthenticateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  UserData user;

  DataResponse({this.user});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class UserData {
  int id;
  String name, email;

  UserData({this.id, this.name, this.email});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
