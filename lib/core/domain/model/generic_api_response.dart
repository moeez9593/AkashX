import 'package:json_annotation/json_annotation.dart';

part 'generic_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericApiResponse {
  final String? message;
  final String? payload;
  final String? code;

  GenericApiResponse(this.message, this.payload, this.code);

  factory GenericApiResponse.fromJson(Map<String, dynamic> json) =>
      _$GenericApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenericApiResponseToJson(this);
}
