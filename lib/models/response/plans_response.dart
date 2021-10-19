

class PlansResponse {

  String CreatedDate;
  int CreatedUserID;
  String Description;
  int ID;
  String Name;
  String No;
  int PPDrawingAreaType;
  int TotalDrawings;
  String UpdatedDate;
  int types;

  PlansResponse({
    this.CreatedDate,
    this.CreatedUserID,
    this.Description,
    this.ID,
    this.Name,
    this.No,
    this.PPDrawingAreaType,
    this.TotalDrawings,
    this.UpdatedDate,
    this.types,
  });

  PlansResponse.fromJsonMap(Map<String, dynamic> map) :
        CreatedDate = map["CreatedDate"],
        CreatedUserID = map["CreatedUserID"],
        Description = map["Description"],
        ID = map["ID"],
        Name = map["Name"],
        No = map["No"],
        PPDrawingAreaType = map["PPDrawingAreaType"],
        TotalDrawings = map["TotalDrawings"],
        UpdatedDate = map["UpdatedDate"],
        types = map["types"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedDate'] = CreatedDate;
    data['CreatedUserID'] = CreatedUserID;
    data['Description'] = Description;
    data['ID'] = ID;
    data['Name'] = Name;
    data['No'] = No;
    data['PPDrawingAreaType'] = PPDrawingAreaType;
    data['TotalDrawings'] = TotalDrawings;
    data['UpdatedDate'] = UpdatedDate;
    data['types'] = types;
    return data;
  }
}
