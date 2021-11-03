class MenuResponse {

  int id;
  String moduleName;
  String image;
  String name;

  MenuResponse(this.id, this.moduleName, this.image, this.name);

  MenuResponse.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        moduleName = map["moduleName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['moduleName'] = moduleName;
    return data;
  }
}