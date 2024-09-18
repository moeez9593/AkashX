import 'package:akashx/features/auth/data/network/dto/login_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponseDTO {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final LoginDataDTO? loginData;

  LoginResponseDTO(this.success, this.message, this.loginData);


  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDTOToJson(this);
}
