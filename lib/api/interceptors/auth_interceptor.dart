import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:gmc_app/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

FutureOr<Request> authInterceptor(request) async {
  final prefs = Get.find<SharedPreferences>();

  if (prefs.getString(StorageConstants.token) != null) {
     request.headers['Authorization'] = 'Bearer ${prefs.getString(StorageConstants.token)}';
    // request.headers['X-Requested-With'] = 'XMLHttpRequest';

  }

  return request as Request;
}
