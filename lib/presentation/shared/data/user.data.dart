import 'package:json_annotation/json_annotation.dart';

part 'user.data.g.dart';

@JsonSerializable()
class UserData {
  int id;
  String name, email;

  UserData({this.id, this.name, this.email});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
