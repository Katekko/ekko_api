// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_user.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateUserResponse _$AuthenticateUserResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticateUserResponse(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$AuthenticateUserResponseToJson(
        AuthenticateUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    user: json['user'] == null
        ? null
        : UserData.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
