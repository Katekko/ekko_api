import 'package:api_ekko/presentation/data/user.data.dart';
import 'package:meta/meta.dart';

class UserModel {
  final int id;
  final String name;
  final String email;

  const UserModel({
    @required this.id,
    @required this.name,
    @required this.email,
  });

  UserData toData() {
    return UserData(id: this.id, email: this.email, name: this.name);
  }
}
