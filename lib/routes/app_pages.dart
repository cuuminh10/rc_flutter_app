import 'package:get/get.dart';
import 'package:gmc_app/modules/welcome/welcome_binding.dart';
import 'package:gmc_app/modules/welcome/welcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
  ];
}
