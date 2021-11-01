class FavorRequest {

  String moduleName;


  FavorRequest(this.moduleName);

  FavorRequest.fromJsonMap(Map<String, dynamic> map):
        moduleName = map["moduleName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleName'] = moduleName;
    return data;
  }
}