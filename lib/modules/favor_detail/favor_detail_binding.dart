import 'package:get/get.dart';
import 'package:gmc_app/modules/favor_detail/favor_detail_controller.dart';

class FavorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavorDetailController>(
        FavorDetailController(apiRepository: Get.find()));
  }
}
