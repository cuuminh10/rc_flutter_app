import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/menu_request.dart';
import 'package:gmc_app/models/response/menu_response.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/constants/storage.dart';
import 'package:gmc_app/shared/ultis/helper.dart';

class MenuController extends GetxController {
  final ApiRepository apiRepository;

  MenuController({this.apiRepository});

  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt selectedPage = 0.obs;

  var listProduction = RxList<MenuResponse>();
  var listPurchase = RxList<MenuResponse>();
  var listFavor = RxList<MenuResponse>();

  @override
  void onReady() async {
    super.onReady();

    initialData();
    listProduction.value
      ..add(MenuResponse(
          1, 'ProductionOrdr', 'assets/images/Jobticket.svg', 'Job Ticket'))
      ..add(MenuResponse(2, 'ProductionFG',
          'assets/images/product-ressult.svg', 'Production Result'))
      ..add(MenuResponse(3, 'POPurchaseReceipt',
          'assets/images/GoodReceiptRequest.svg', 'Good Receipt Request'));

    listPurchase.value
      ..add(
          MenuResponse(4, 'FGReceipt', 'assets/svg/paper.svg', 'Good Receipt'))
      ..add(MenuResponse(
          5, 'PR', 'assets/images/Purchase_Request.svg', 'Purchase Request'))
      ..add(MenuResponse(
          6, 'PO', 'assets/images/purchase-order.svg', 'Purchase Order'))
      ..add(MenuResponse(
          7, 'ApprovalProcessConfig', 'assets/svg/paper.svg', 'Approval Form'));
  }

  void changePage(int pageNum) {
    selectedPage.value = pageNum;
    pageController.value.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void initialData() async {
    final res = await apiRepository.onGetFavor('/favor');
    if (res != null) {
      listFavor.value = res;
    }
  }

  bool checkContainsFavor(MenuResponse favor) {
    return listFavor.value
            .where((element) => element.moduleName == favor.moduleName)
            .isNotEmpty
        ? true
        : false;
  }

  void onTapButtonMenu(MenuResponse favor) {
    var obj;
    try {
      obj = listFavor
          .firstWhere((element) => element.moduleName == favor.moduleName);

      if (obj != null) {
        deleteFavor(obj.id, obj);
      } else {
        postFavor(favor);
      }
    } catch (e) {
      postFavor(favor);
    }
  }

  Future postFavor(MenuResponse favor) async {
    final res = await apiRepository.onPostFavorMenu(
        '/favor', MenuRequest(favor.moduleName));
    if (res != null) {
      listFavor.value.add(res);
      listFavor.refresh();
      listPurchase.refresh();
      listProduction.refresh();
    }
  }

  Future deleteFavor(int id, MenuResponse favor) async {
    final res = await apiRepository.onDeleteFavor('/favor/${id}');
    if (res != null) {
      listFavor.value.remove(favor);
      listFavor.refresh();
      listPurchase.refresh();
      listProduction.refresh();
    }
  }

  String getNameImageModule(MenuResponse favor) {
    return helper.FilterImage(favor.moduleName);
  }

  String getFullNameModule(MenuResponse favor) {
    return helper.FilterName(favor.moduleName);
  }

    void redirectTo(MenuResponse favor) {
      var data = helper.filterScreensGMC(favor.moduleName);

      if (data != null) {
        GetStorage().write(StorageConstants.infoScreen, data);
        Get.toNamed(data['screen'], arguments: data['name']);
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Module not yet!",
          backgroundColor: Colors.white,
          titleStyle: TextStyle(color: ColorConstants.Blue800),
          middleTextStyle: TextStyle(color: ColorConstants.Blue800),
        );
      }
    }
}
