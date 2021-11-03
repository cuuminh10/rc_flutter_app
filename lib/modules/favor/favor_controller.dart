import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/response/favor_reponse.dart';
import 'package:gmc_app/shared/constants/constants.dart';

class FavorController extends GetxController {
  final ApiRepository apiRepository;
  var infoScreen = GetStorage().read(StorageConstants.infoScreen);
  var favorListRequest = GetStorage().read(StorageConstants.favorListRequest) ?? FavorListRequest();
  FavorController({this.apiRepository});
  RxString tittle = ''.obs;
  var arguments = Get.arguments;
  var listFavor =  RxList<FavorResponse>();
  RxBool showInputSearch = false.obs;
  final searchController = TextEditingController();
  var listFavorSearch = RxList<FavorResponse>();



  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  @override
  void onReady() async {
    super.onReady();
    tittle.value = arguments;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initialData() async{
    final res = await apiRepository.onPostFavor('/productOrder/search/v2/${infoScreen['code']}', favorListRequest);
    if (res != null) {
      listFavor.value = res;
      listFavorSearch.value = res;
      listFavorSearch.refresh();
    }
  }

  void onClickSearch () {
    showInputSearch.value = !showInputSearch.value;
  }

  redirectTo(FavorResponse favorListItem) {}

  onChangeSearch(String e) {
    e = e.toLowerCase().trim();
    var newList = listFavor.value.where((element) => element.no.toLowerCase().contains(e)).toList();
    listFavorSearch.value = newList;
    listFavorSearch.refresh();
  }
}
