import 'package:get/get.dart';
import 'package:gmc_app/modules/menu/menu_controller.dart';
import 'package:gmc_app/modules/welcome/welcome_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController(apiRepository: Get.find()));
  }
}
