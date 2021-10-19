

class LoginResponse {

  String token;
  int ADUserID;
  String AAStatus;
  int ADUserGroupID;
  int ADContactID;
  String ADUserName;
  String ADPassword;
  String ADProfileDirectory;
  String ADUserStyle;
  String ADUserStyleSkin;
  String ADUserCurLang;
  String ADUserIsLockedCheck;
  String ADUserFirstName;
  String ADUserLastName;
  String ADUserStatus;
  String ADUserType;
  String ADUserCompanyID;


  LoginResponse({
    this.token,
  });

  LoginResponse.fromJsonMap(Map<String, dynamic> map) :
        token = map["token"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}
