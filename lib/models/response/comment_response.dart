class CommentResponse {

  int id;
  String avatarUrl;
  String comment;
  String createUser;
  String createDate;


  CommentResponse.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        avatarUrl = map["avatarUrl"],
        comment = map["comment"],
        createUser = map["createUser"],
        createDate = map["createDate"];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['avatarUrl'] = avatarUrl;
    data['comment'] = comment;
    data['createUser'] = createUser;
    data['createDate'] = createDate;
    return data;
  }
}