import 'package:get/get.dart';
import 'package:gmc_app/modules/auth/auth_binding.dart';
import 'package:gmc_app/modules/auth/auth_screen.dart';
import 'package:gmc_app/modules/favor_list/favor_list_binding.dart';
import 'package:gmc_app/modules/favor_list/favor_list_screen.dart';
import 'package:gmc_app/modules/menu/menu_binding.dart';
import 'package:gmc_app/modules/menu/menu_screen.dart';
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
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuScreen(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: Routes.FAVOR_LIST,
      page: () => FavorListScreen(),
      binding:  FavorListBinding(),
    ),
  ];
}
