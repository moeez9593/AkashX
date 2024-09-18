// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericApiResponse _$GenericApiResponseFromJson(Map<String, dynamic> json) =>
    GenericApiResponse(
      json['message'] as String?,
      json['payload'] as String?,
      json['code'] as String?,
    );

Map<String, dynamic> _$GenericApiResponseToJson(GenericApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
      'code': instance.code,
    };
