

import 'package:get/get.dart';
import 'package:gmc_app/api/base_provider.dart';
import 'package:gmc_app/models/request/comment_request.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/request/menu_request.dart';
import 'package:gmc_app/models/request/login_request.dart';
import 'package:gmc_app/models/response/attach_response.dart';
import 'package:gmc_app/models/response/comment_response.dart';
import 'package:gmc_app/models/response/favor_detail_reponse.dart';
import 'package:gmc_app/models/response/favor_list_response.dart';
import 'package:gmc_app/models/response/favor_reponse.dart';
import 'package:gmc_app/models/response/menu_response.dart';
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

  Future<RxList<MenuResponse>> onGetFavor(String path) async {
    final res = await apiProvider.onGetFavor(path);
    if (res.statusCode == 200) {
      final List<dynamic> listResult = res.body.map((comment) {
        return MenuResponse.fromJsonMap(comment);
      }).toList();

      return  RxList<MenuResponse>.from(listResult);
    }
  }

  Future<MenuResponse> onPostFavorMenu(String path, MenuRequest favorRequest) async {
    final res = await apiProvider.onPostFavorMenu(path, favorRequest);
    if (res.statusCode == 200) {
      return MenuResponse.fromJsonMap(res.body);
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

  Future<RxList<FavorResponse>> onPostFavor(String path, FavorListRequest favorRequest) async {
    final res = await apiProvider.onPostFavor(path, favorRequest);
    if (res.statusCode == 200) {
      final List<dynamic> listResult = res.body.map((comment) {
        return FavorResponse.fromJsonMap(comment);
      }).toList();

      return  RxList<FavorResponse>.from(listResult);
    }
  }

  Future<FavorDetailResponse> onGetFavorDetail(String path) async {
    final res = await apiProvider.onGetFavorDetail(path);
    if (res.statusCode == 200) {
      return FavorDetailResponse.fromJsonMap(res.body);
    }
  }

  Future<CommentResponse> onPostComment(String path, CommentRequest commentRequest) async {
    final res = await apiProvider.onPostComment(path, commentRequest);
    if (res.statusCode == 200) {
      return CommentResponse.fromJsonMap(res.body);
    }
  }

  Future<AttachResponse> onPostAttach(String path, FormData formData) async {
    final res = await apiProvider.onAttachComment(path, formData);
    if (res.statusCode == 200) {
      return AttachResponse.fromJsonMap(res.body);
    }
  }
}
