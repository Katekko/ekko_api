import 'package:json_annotation/json_annotation.dart';

part 'recover_password.body.g.dart';

@JsonSerializable()
class RecoverPasswordBody {
  final String? email;
  const RecoverPasswordBody({this.email});

  factory RecoverPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RecoverPasswordBodyToJson(this);
}
