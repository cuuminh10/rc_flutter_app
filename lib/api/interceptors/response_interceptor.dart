import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:gmc_app/models/models.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();

  if (response.statusCode != 200 && response.statusCode != 201) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.message);
      break;
    default:
  }

  return;
}


