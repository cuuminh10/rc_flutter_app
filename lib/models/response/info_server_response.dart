class InfoServerResponse {
  String serverName;
  String urlApi;
  String keys;

  InfoServerResponse({
    this.serverName,
    this.urlApi,
    this.keys,
  });

  InfoServerResponse.fromJsonMap(Map<String, dynamic> map)
      : serverName = map["serverName"],
        urlApi = map["urlApi"],
        keys = map["keys"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverName'] = serverName;
    data['urlApi'] = urlApi;
    data['keys'] = keys;
    return data;
  }
}
