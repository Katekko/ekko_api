import 'package:api_ekko/presentation/data/user.data.dart';

class UserModel {
  final String id;
  final String login;
  final String name;
  final String email;

  const UserModel({
    required this.id,
    required this.login,
    required this.name,
    required this.email,
  });

  UserData toData() {
    return UserData(
      id: this.id,
      login: this.login,
      email: this.email,
      name: this.name,
    );
  }
}
