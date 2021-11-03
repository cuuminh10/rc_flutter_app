
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/request/menu_request.dart';
import 'package:gmc_app/models/request/login_request.dart';

import 'base_provider.dart';


class ApiProvider extends BaseProvider {

  Future<Response> onInfoServer(String path) {
    return get(path);
  }

  Future<Response> onGetFavor(String path) {
    return get(path);
  }

  Future<Response> onPostFavorMenu(String path, MenuRequest favorRequest) {
    return post(path, favorRequest.toJson());
  }

  Future<Response> onDeleteFavor(String path) {
    return delete(path);
  }

  Future<Response> onLogin(String path, LoginRequest loginRequest) {
    return post(path, loginRequest.toJson());
  }

  Future<Response> onPostListFavor(String path, FavorListRequest favorRequest) {
    return post(path, favorRequest.toJson());
  }

  Future<Response> onPostFavor(String path, FavorListRequest favorRequest) {
    return post(path, favorRequest.toJson());
  }
}
