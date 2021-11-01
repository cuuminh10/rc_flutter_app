

class LoginResponse {

  int id;
  int groupId;
  int contactId;
  String username;
  String token;


  LoginResponse({
    this.token,
    this.id,
    this.groupId,
    this.contactId,
    this.username
  });

  LoginResponse.fromJsonMap(Map<String, dynamic> map) :
        token = map["token"],
        id = map["id"],
        groupId = map["groupId"],
        contactId = map["contactId"],
        username = map["username"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['id"'] = id;
    data['groupId'] = groupId;
    data['contactId'] = contactId;
    data['username'] = username;
    return data;
  }
}
