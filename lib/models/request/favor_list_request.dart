class FavorListRequest {
  String status;
  String workCenter;
  String workOrder;
  String jobTicket;
  String phase;
  String createDate;
  String groupByColumn;
  String groupByValue;

  FavorListRequest({this.status = "", this.workCenter = "", this.workOrder = "", this.jobTicket = "", this.phase = "", this.createDate = null, this.groupByColumn = "", this.groupByValue = ""});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['workCenter'] = workCenter;
    data['workOrder'] = workOrder;
    data['jobTicket'] = jobTicket;
    data['phase'] = phase;
    data['createDate'] = createDate;
    data['groupByColumn'] = groupByColumn;
    data['groupByValue'] = groupByValue;
    return data;
  }
}