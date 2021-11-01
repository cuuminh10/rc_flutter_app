import 'package:get/get.dart';
import 'package:gmc_app/modules/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(apiRepository: Get.find()));
  }
}
