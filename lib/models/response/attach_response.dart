class AttachResponse {

  int id;
  String realName;
  String saveName;
  String createUser;
  String createDate;


  AttachResponse.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        realName = map["realName"],
        saveName = map["saveName"],
        createUser = map["createUser"],
        createDate = map["createDate"];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['realName'] = realName;
    data['saveName'] = saveName;
    data['createUser'] = createUser;
    data['createDate'] = createDate;
    return data;
  }
}