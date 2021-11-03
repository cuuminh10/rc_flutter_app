class MenuRequest {

  String moduleName;


  MenuRequest(this.moduleName);

  MenuRequest.fromJsonMap(Map<String, dynamic> map):
        moduleName = map["moduleName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleName'] = moduleName;
    return data;
  }
}