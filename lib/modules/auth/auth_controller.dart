

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gmc_app/api/api_provider.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/login_request.dart';
import 'package:gmc_app/models/response/info_server_response.dart';
import 'package:gmc_app/routes/app_pages.dart';
import 'package:gmc_app/shared/constants/storage.dart';
import 'package:gmc_app/shared/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;

  AuthController({this.apiRepository});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final inputServerController = TextEditingController();
  var listServer =  RxList<InfoServerResponse>();
  RxBool isVisiblePassword = true.obs;
  RxBool isCheckedServer = false.obs;
  RxBool isOnChange = false.obs;
  RxString serverName = 'Server'.obs;
  var storage = Get.find<SharedPreferences>();
  RxString dropdownValue = 'Web Mobibe System'.obs;


  @override
  void onInit() {
    super.onInit();
    final prefs = Get.find<SharedPreferences>();
    // INIT list server
    handleOnChangeController();
  }

  @override
  void onReady() async {
    super.onReady();
    initialData();
    try {
      if (storage.getString(StorageConstants.token) != null) {
        Get.toNamed(Routes.MENU);
      } else {
        Get.toNamed(Routes.AUTH);
      }
    } catch (e) {
      Get.toNamed(Routes.AUTH);
    }
  }

  void loadInfoServer() async {
    final res = await apiRepository.onInfoServer('/common/info/server');
    if (res != null) {
      listServer.value = res;
    }
  }

  void initialData () async {
    loadInfoServer();
  }
  
  void changeServer (String server) {
    dropdownValue.value = server;
    Get.find<ApiProvider>().httpClient.baseUrl= listServer.value.firstWhere((element) => element.serverName == server).urlApi;
  }

  void handleOnChangeController() {
    if (loginEmailController.text.isNotEmpty ||
        loginPasswordController.text.isNotEmpty) {
      isOnChange.value = true;
    } else {
      isOnChange.value = false;
    }
  }

  void login(BuildContext context) async {
    if (loginFormKey.currentState.validate()) {
      final res = await apiRepository.onLogin(
          '/Users/login', LoginRequest(username: loginEmailController.text, password: loginPasswordController.text)
      );
      //
      // final prefs = Get.find<SharedPreferences>();
      if (res != null && res.token.isNotEmpty) {
        storage.setString(StorageConstants.token, res.token);
        // GetStorage().write(StorageConstants.userInfo, res);
        storage.setString(StorageConstants.username, res.username);
         Get.toNamed(Routes.MENU);
        // loadPriorityConfig();
      }
    }
  }

  void loadPriorityConfig() async {
    // final res = await apiRepository.onProrityConfig(
    //     "/settings/priorityConfig");
    //
    // if (res != null) {
    //   listPriorityConfig.value = res;
    // }
  }



  void selectServer(dynamic server) async {
    // serverName.value = jsonDecode(server)['name'];
    // ApiConstants.baseUrl = jsonDecode(server)['api'];
    // Get.find<ApiProvider>().httpClient.baseUrl = jsonDecode(server)['api'];
    // // Get.back();
  }

  void inputSever() async {
    // final List<DemandResponse> res =
    // await apiRepository.onDemain('/settings/onDemand');
    //
    // DemandResponse server =
    // res.firstWhere((element) => element.key == inputServerController.text);
    //
    // final prefs = Get.find<SharedPreferences>();
    // var currentList = prefs.getStringList(StorageConstants.servers) ?? [];
    //
    // var isExistsServer = currentList
    //     .where((element) => jsonDecode(element)['key'] == server.key);
    // if (isExistsServer.isEmpty) {
    //   currentList.add(jsonEncode(server));
    //   await prefs.setStringList(StorageConstants.servers, currentList);
    //   listServer.value = currentList;
    // } else {
    //   Get.snackbar(StringConstant.server, StringConstant.errorServer);
    // }
  }

  @override
  void onClose() {
    super.onClose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}