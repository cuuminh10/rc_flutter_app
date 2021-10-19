

class DrawResponse {

  String AACreatedDate;
  String AACreatedUser;
  int FK_ADUserID;
  int FK_PMProjectID;
  int FK_PMProjectLocationID;
  int FK_PPDrawingAreaID;
  int FK_PPDrawingParentID;
  int FK_PPProjectDiscID;
  String PPDrawingDesc;
  String PPDrawingFileName;
  int PPDrawingID;
  String PPDrawingImgFileName;
  int PPDrawingMinZoomLevel;
  String PPDrawingName;
  String PPDrawingNo;
  int PPDrawingOriginalHeight;
  int PPDrawingOriginalWidth;
  String PPDrawingServerPath;
  String PPDrawingStatus;

  DrawResponse({
    this.AACreatedDate,
    this.AACreatedUser,
    this.FK_ADUserID,
    this.FK_PMProjectID,
    this.FK_PMProjectLocationID,
    this.FK_PPDrawingAreaID,
    this.FK_PPDrawingParentID,
    this.FK_PPProjectDiscID,
    this.PPDrawingDesc,
    this.PPDrawingFileName,
    this.PPDrawingID,
    this.PPDrawingImgFileName,
    this.PPDrawingMinZoomLevel,
    this.PPDrawingName,
    this.PPDrawingNo,
    this.PPDrawingOriginalHeight,
    this.PPDrawingOriginalWidth,
    this.PPDrawingServerPath,
    this.PPDrawingStatus,
  });

  DrawResponse.fromJsonMap(Map<String, dynamic> map) :
        AACreatedDate = map["AACreatedDate"],
        AACreatedUser = map["AACreatedUser"],
        FK_ADUserID = map["FK_ADUserID"],
        FK_PMProjectID = map["FK_PMProjectID"],
        FK_PMProjectLocationID = map["FK_PMProjectLocationID"],
        FK_PPDrawingAreaID = map["FK_PPDrawingAreaID"],
        FK_PPDrawingParentID = map["FK_PPDrawingParentID"],
        FK_PPProjectDiscID = map["FK_PPProjectDiscID"],
        PPDrawingDesc = map["PPDrawingDesc"],
        PPDrawingFileName = map["PPDrawingFileName"],
        PPDrawingID = map["PPDrawingID"],
        PPDrawingImgFileName = map["PPDrawingImgFileName"],
        PPDrawingMinZoomLevel = map["PPDrawingMinZoomLevel"],
        PPDrawingName = map["PPDrawingName"],
        PPDrawingNo = map["PPDrawingNo"],
        PPDrawingOriginalHeight = map["PPDrawingOriginalHeight"],
        PPDrawingOriginalWidth = map["PPDrawingOriginalWidth"],
        PPDrawingServerPath = map["PPDrawingServerPath"],
        PPDrawingStatus = map["PPDrawingStatus"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AACreatedDate'] = AACreatedDate;
    data['AACreatedUser'] = AACreatedUser;
    data['FK_ADUserID'] = FK_ADUserID;
    data['FK_PMProjectID'] = FK_PMProjectID;
    data['FK_PMProjectLocationID'] = FK_PMProjectLocationID;
    data['FK_PPDrawingAreaID'] = FK_PPDrawingAreaID;
    data['FK_PPDrawingParentID'] = FK_PPDrawingParentID;
    data['FK_PPProjectDiscID'] = FK_PPProjectDiscID;
    data['PPDrawingDesc'] = PPDrawingDesc;
    data['PPDrawingFileName'] = PPDrawingFileName;
    data['PPDrawingID'] = PPDrawingID;
    data['PPDrawingImgFileName'] = PPDrawingImgFileName;
    data['PPDrawingMinZoomLevel'] = PPDrawingMinZoomLevel;
    data['PPDrawingName'] = PPDrawingName;
    data['PPDrawingNo'] = PPDrawingNo;
    data['PPDrawingOriginalHeight'] = PPDrawingOriginalHeight;
    data['PPDrawingOriginalWidth'] = PPDrawingOriginalWidth;
    data['PPDrawingServerPath'] = PPDrawingServerPath;
    data['PPDrawingStatus'] = PPDrawingStatus;
    return data;
  }
}
