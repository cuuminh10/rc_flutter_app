import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'shared/services/services.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    GetStorage.init();
    await Get.putAsync(() => StorageService().init());
  }
}
