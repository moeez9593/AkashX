// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataDTO _$LoginDataDTOFromJson(Map<String, dynamic> json) => LoginDataDTO(
      json['token'] as String,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataDTOToJson(LoginDataDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user?.toJson(),
    };
