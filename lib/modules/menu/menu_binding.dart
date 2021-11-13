import 'package:get/get.dart';
import 'package:gmc_app/modules/menu/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<MenuController>(() => MenuController(apiRepository: Get.find()));
  }
}
