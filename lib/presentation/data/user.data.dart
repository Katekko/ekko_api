import 'package:json_annotation/json_annotation.dart';

part 'user.data.g.dart';

@JsonSerializable()
class UserData {
  final String id;
  final String login, name, email;

  const UserData({
    required this.id,
    required this.login,
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
