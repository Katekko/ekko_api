import 'package:json_annotation/json_annotation.dart';

part 'recover_password.body.g.dart';

@JsonSerializable()
class RecoverPasswordBody {
  String email;

  RecoverPasswordBody({String email}) {
    this.email = email;
  }

  factory RecoverPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$RecoverPasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RecoverPasswordBodyToJson(this);
}
