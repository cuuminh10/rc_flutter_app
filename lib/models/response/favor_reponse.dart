class FavorResponse {

  String no;
  String phaseName;
  String productDate;

  FavorResponse(this.no, this.phaseName, this.productDate);

  FavorResponse.fromJsonMap(Map<String, dynamic> map):
        no = map["no"],
        productDate = map["productDate"],
        phaseName = map["phaseName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = no;
    data['productDate'] = productDate;
    data['phaseName'] = phaseName;
    return data;
  }
}