
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gmc_app/models/request/comment_request.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/request/menu_request.dart';
import 'package:gmc_app/models/request/login_request.dart';
import 'package:get/get.dart';
import 'package:gmc_app/models/request/product_order_request.dart';

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

  Future<Response> onGetFavorDetail(String path) {
    return get(path);
  }

  Future<Response> onPostComment(String path, CommentRequest commentRequest) {
    return post(path, commentRequest.toJson());
  }

  Future<Response> onAttachComment(String path, FormData form) {
    return post(path, form, contentType: 'multipart/form-data');
  }

  Future<Response> onPutProductOrder(String path, ProductOrderRequest productOrderRequest) {
    return put(path, productOrderRequest.toJson());
  }
}
