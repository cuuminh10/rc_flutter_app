class DemandResponse {

  String name;
  String key;
  String api;
  String drawingBasedURL;

  DemandResponse({this.name, this.key, this.api, this.drawingBasedURL});


  DemandResponse.fromJsonMap(Map<String, dynamic> map):
        name = map["name"],
        key = map["key"],
        api = map["api"],
        drawingBasedURL = map["drawingBasedURL"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['key'] = key;
    data['api'] = api;
    data['drawingBasedURL'] = drawingBasedURL;
    return data;
  }
}


