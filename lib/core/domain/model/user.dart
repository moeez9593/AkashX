import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  @JsonKey(name: "first_name")
  final String firstname;
  @JsonKey(name: "last_name")
  final String lastname;

  final String? image;

  User(this.id, this.firstname, this.lastname, this.image);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
