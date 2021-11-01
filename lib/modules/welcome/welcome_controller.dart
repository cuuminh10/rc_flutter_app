import 'package:get/get.dart';
import 'package:gmc_app/routes/routes.dart';

class WelcomeController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    Get.toNamed(Routes.AUTH);
  }
}
