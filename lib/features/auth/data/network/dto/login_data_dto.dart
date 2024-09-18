import 'package:akashx/core/domain/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDataDTO {
  @JsonKey(name: "token")
  final String token;

  final User? user;

  LoginDataDTO(this.token, this.user);

  factory LoginDataDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataDTOToJson(this);
}
