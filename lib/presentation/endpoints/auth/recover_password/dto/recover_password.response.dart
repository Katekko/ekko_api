import 'package:json_annotation/json_annotation.dart';

part 'recover_password.response.g.dart';

@JsonSerializable()
class RecoverPasswordResponse {
  final bool success;
  final DataResponse? data;
  final String? error;
  const RecoverPasswordResponse({required this.success, this.error, this.data});

  factory RecoverPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecoverPasswordResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  const DataResponse();

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
