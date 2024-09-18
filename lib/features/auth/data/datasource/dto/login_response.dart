
import 'package:json_annotation/json_annotation.dart';


part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  String? authToken;
  String? message;
  LoginResponse({
    required this.authToken,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
