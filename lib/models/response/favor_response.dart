class FavorResponse {

  int id;
  String moduleName;
  String image;
  String name;

  FavorResponse(this.id, this.moduleName, this.image, this.name);

  FavorResponse.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        moduleName = map["moduleName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['moduleName'] = moduleName;
    return data;
  }
}