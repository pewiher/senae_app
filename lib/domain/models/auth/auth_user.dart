// To parse this JSON data, do
//
//     final authUser = authUserFromJson(jsonString);

import 'dart:convert';

AuthUser authUserFromJson(String str) => AuthUser.fromJson(json.decode(str));

String authUserToJson(AuthUser data) => json.encode(data.toJson());

class AuthUser {
  String refresh;
  String access;
  String fullName;
  int userId;
  String lineaNegocio;

  AuthUser({
    required this.refresh,
    required this.access,
    required this.fullName,
    required this.userId,
    required this.lineaNegocio,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        refresh: json["refresh"],
        access: json["access"],
        fullName: json["full_name"],
        userId: json["user_id"],
        lineaNegocio: json["lineaNegocio"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "full_name": fullName,
        "user_id": userId,
        "lineaNegocio": lineaNegocio,
      };
}
