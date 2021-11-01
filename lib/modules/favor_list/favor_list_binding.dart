import 'package:get/get.dart';
import 'favor_list_controller.dart';

class FavorListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavorListController>(
        FavorListController(apiRepository: Get.find()));
  }
}
