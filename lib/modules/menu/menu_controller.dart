import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/favor_request.dart';
import 'package:gmc_app/models/response/favor_response.dart';
import 'package:gmc_app/shared/ultis/helper.dart';

class MenuController extends GetxController {

  final ApiRepository apiRepository;

  MenuController({this.apiRepository});

  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt selectedPage = 0.obs;

  var listProduction =  RxList<FavorResponse>();
  var listPurchase =  RxList<FavorResponse>();
  var listFavor =  RxList<FavorResponse>();


  @override
  void onReady() async {
    super.onReady();

    initialData();
    listProduction.value
      ..add(FavorResponse(1, 'ProductionOrdr', 'assets/images/Jobticket.svg', 'Job Ticket'))
      ..add(FavorResponse(
          2, 'ProductionFG', 'assets/images/product-ressult.svg', 'Production Result'))
      ..add(FavorResponse(3, 'POPurchaseReceipt', 'assets/images/GoodReceiptRequest.svg',
          'Good Receipt Request'));

    listPurchase.value
      ..add(FavorResponse(4, 'FGReceipt', 'assets/svg/paper.svg', 'Good Receipt'))
      ..add(FavorResponse(
          5, 'PR', 'assets/images/Purchase_Request.svg', 'Purchase Request'))
      ..add(FavorResponse(6, 'PO', 'assets/images/purchase-order.svg',
          'Purchase Order'))
      ..add(FavorResponse(7, 'ApprovalProcessConfig', 'assets/svg/paper.svg',
          'Approval Form'));
  }

  void changePage(int pageNum) {
    selectedPage.value = pageNum;
    pageController.value.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void initialData() async{
    final res = await apiRepository.onGetFavor('/favor_list');
    if (res != null) {
      listFavor.value = res;
    }
  }

  bool checkContainsFavor(FavorResponse favor) {
      return listFavor.value.where((element) => element.moduleName == favor.moduleName).isNotEmpty ? true : false;
  }

  void onTapButtonMenu(FavorResponse favor)  {
    var obj;
    try {
       obj = listFavor.firstWhere((element) => element.moduleName == favor.moduleName);

      if (obj != null) {
        deleteFavor(obj.id, obj);
      }else {
        postFavor(favor);
      }
    } catch (e) {
      postFavor(favor);
    }

  }

  Future postFavor (FavorResponse favor) async {
    final res = await apiRepository.onPostFavor('/favor_list', FavorRequest(favor.moduleName));
    if (res != null) {
      listFavor.value.add(res);
      listFavor.refresh();
      listPurchase.refresh();
      listProduction.refresh();
    }
  }

  Future deleteFavor (int id, FavorResponse favor) async {
    final res = await apiRepository.onDeleteFavor('/favor_list/${id}');
    if (res != null) {
      listFavor.value.remove(favor);
      listFavor.refresh();
      listPurchase.refresh();
      listProduction.refresh();
    }
  }
  String getNameImageModule (FavorResponse favor) {
    return helper.FilterImage(favor.moduleName);
  }

  String getFullNameModule (FavorResponse favor) {
    return helper.FilterName(favor.moduleName);
  }
}
