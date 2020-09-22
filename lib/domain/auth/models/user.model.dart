import 'package:api_ekko/presentation/auth/authenticate_user/dto/authenticate_user.response.dart';
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
