// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    email: json['email'] as String?,
    fullName: json['fullName'] as String?,
    password: json['password'] as String?,
    roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'roles': instance.roles,
    };
