import 'dart:convert';

AuthError authErrorFromJson(String str) => AuthError.fromJson(json.decode(str));

String authErrorToJson(AuthError data) => json.encode(data.toJson());

class AuthError {
  Errors errors;
  dynamic data;
  String status;
  int code;

  AuthError({
    required this.errors,
    required this.data,
    required this.status,
    required this.code,
  });

  factory AuthError.fromJson(Map<String, dynamic> json) => AuthError(
        errors: Errors.fromJson(json["errors"]),
        data: json["data"],
        status: json["status"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "errors": errors.toJson(),
        "data": data,
        "status": status,
        "code": code,
      };
}

class Errors {
  String details;

  Errors({
    required this.details,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "details": details,
      };
}
