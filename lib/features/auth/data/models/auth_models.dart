import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';


@JsonSerializable()
class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$AuthResponseModelFromJson(json);
    } catch (e) {
      throw Exception("Unexpected API response format: $json");
    }
  }

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}


@JsonSerializable()
class UserModel {
  final String uuid;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final List<String> roles;

  UserModel({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
