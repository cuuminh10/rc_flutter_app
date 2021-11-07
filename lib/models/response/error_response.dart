import 'dart:convert';

class ErrorResponse {
  ErrorResponse({
     this.message
  });

  String message;

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
