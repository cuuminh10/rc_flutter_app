class FavorListResponse {
  int counts;
  String name;


  FavorListResponse(this.counts, this.name);

  FavorListResponse.fromJsonMap(Map<String, dynamic> map):
        counts = map["counts"],
        name = map["name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counts'] = counts;
    data['name'] = name;
    return data;
  }
}