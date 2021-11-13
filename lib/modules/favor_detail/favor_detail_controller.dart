

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/response/favor_detail_reponse.dart';
import 'package:gmc_app/models/response/favor_reponse.dart';
import 'package:gmc_app/shared/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavorDetailController extends GetxController {
  final ApiRepository apiRepository;

  FavorDetailController({this.apiRepository});

  RxInt selectedPage = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  final commentTextController = TextEditingController();
  RxBool isOnChange = false.obs;
  RxString reply = ''.obs;
  RxString beforePathImage = ''.obs;
  RxString afterPathImage = ''.obs;
  dynamic infoScreen = GetStorage().read(StorageConstants.infoScreen);
  FavorResponse arguments = Get.arguments;
  RxString tittle = ''.obs;
  Rx<FavorDetailResponse> favorDetailResponse = FavorDetailResponse().obs;
  var descriptionTextFieldController = TextEditingController();
  RxBool isReadOnlyDescription = false.obs;
  RxString labelButton = ''.obs;




  @override
  void onInit() {
    super.onInit();
    final prefs = Get.find<SharedPreferences>();
    // INIT list server
  }

  @override
  void onReady() async {
    super.onReady();
    initialData();
  }


  void initialData () async {
    final res = await apiRepository.onGetFavorDetail('/productOrder/detail/v2/${infoScreen['code']}/${arguments.no.trim().replaceAll(RegExp(r'/'), '%2F')}');
    if (res != null) {
      favorDetailResponse.value = res;
      descriptionTextFieldController.value = TextEditingValue(text: res.description);
    }
  }

  void replyFunction(String msg) {
    reply.value = msg;
  }

  void changePage(int pageNum) {
    selectedPage.value = pageNum;
    pageController.value.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}