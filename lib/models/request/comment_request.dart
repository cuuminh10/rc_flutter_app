import 'dart:convert';

class CommentRequest {
  CommentRequest({
    this.content
  });

  String content;

  factory CommentRequest.fromRawJson(String str) =>
      CommentRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommentRequest.fromJson(Map<String, dynamic> json) => CommentRequest(
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
  };
}
