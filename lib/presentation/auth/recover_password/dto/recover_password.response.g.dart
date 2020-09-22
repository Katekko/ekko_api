// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverPasswordResponse _$RecoverPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return RecoverPasswordResponse(
    success: json['success'] as bool,
    error: json['error'] as String,
    data: json['data'] == null
        ? null
        : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecoverPasswordResponseToJson(
        RecoverPasswordResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse();
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{};
