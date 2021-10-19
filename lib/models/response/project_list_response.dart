

class ProjectListResponse {

  String PMProjectName;
  int PMProjectID;
  String PMProjectDesc;
  String PMProjectStatusTypeCombo;


  ProjectListResponse({
    this.PMProjectName,
    this.PMProjectID,
    this.PMProjectDesc,
    this.PMProjectStatusTypeCombo
  });

  ProjectListResponse.fromJsonMap(Map<String, dynamic> map) :
        PMProjectName = map["PMProjectName"],
        PMProjectID = map["PMProjectID"],
        PMProjectStatusTypeCombo = map["PMProjectStatusTypeCombo"],
        PMProjectDesc = map["PMProjectDesc"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PMProjectName'] = PMProjectName;
    data['PMProjectID'] = PMProjectID;
    data['PMProjectStatusTypeCombo'] = PMProjectStatusTypeCombo;
    data['PMProjectDesc'] = PMProjectDesc;
    return data;
  }
}
