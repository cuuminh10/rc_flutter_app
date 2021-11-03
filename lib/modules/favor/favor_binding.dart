import 'package:get/get.dart';

import 'favor_controller.dart';

class FavorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavorController>(
        FavorController(apiRepository: Get.find()));
  }
}
