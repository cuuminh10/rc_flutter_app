

import 'package:get/get.dart';
import 'package:gmc_app/api/base_provider.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/request/favor_request.dart';
import 'package:gmc_app/models/request/login_request.dart';
import 'package:gmc_app/models/response/favor_list_response.dart';
import 'package:gmc_app/models/response/favor_response.dart';
import 'package:gmc_app/models/response/info_server_response.dart';
import 'package:gmc_app/models/response/login_response.dart';

import 'api_provider.dart';

class ApiRepository extends BaseProvider{
  ApiRepository({this.apiProvider});

  final ApiProvider apiProvider;

  Future<RxList<InfoServerResponse>> onInfoServer(String path) async {
    final res = await apiProvider.onInfoServer(path);
    if (res.statusCode == 200) {
      final List<dynamic> listResult = res.body.map((comment) {
        return InfoServerResponse.fromJsonMap(comment);
      }).toList();

      return  RxList<InfoServerResponse>.from(listResult);
    }
  }

  Future<LoginResponse> onLogin(String path, LoginRequest loginRequest) async {
    final res = await apiProvider.onLogin(path, loginRequest);
    if (res.statusCode == 200) {
      return LoginResponse.fromJsonMap(res.body);
    }
  }

  Future<RxList<FavorResponse>> onGetFavor(String path) async {
    final res = await apiProvider.onGetFavor(path);
    if (res.statusCode == 200) {
      final List<dynamic> listResult = res.body.map((comment) {
        return FavorResponse.fromJsonMap(comment);
      }).toList();

      return  RxList<FavorResponse>.from(listResult);
    }
  }

  Future<FavorResponse> onPostFavor(String path, FavorRequest favorRequest) async {
    final res = await apiProvider.onPostFavor(path, favorRequest);
    if (res.statusCode == 200) {
      return FavorResponse.fromJsonMap(res.body);
    }
  }

  Future<int> onDeleteFavor(String path) async {
    final res = await apiProvider.onDeleteFavor(path);
    if (res.statusCode == 200) {
      return res.body;
    }
  }

  Future<RxList<FavorListResponse>> onPostListFavor(String path, FavorListRequest favorListRequest) async {
    final res = await apiProvider.onPostListFavor(path, favorListRequest);
    if (res.statusCode == 200) {
      final List<dynamic> listResult = res.body.map((comment) {
        return FavorListResponse.fromJsonMap(comment);
      }).toList();

      return  RxList<FavorListResponse>.from(listResult);
    }
  }

}