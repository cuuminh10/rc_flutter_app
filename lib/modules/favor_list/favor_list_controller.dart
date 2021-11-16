import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/response/favor_list_response.dart';
import 'package:gmc_app/routes/app_pages.dart';
import 'package:gmc_app/shared/constants/constants.dart';
import 'package:gmc_app/shared/constants/global.dart';
import 'package:gmc_app/shared/ultis/helper.dart';

class FavorListController extends GetxController {
  final ApiRepository apiRepository;
  Map<String, String> listSort = Global.listSortFavor();
  var infoScreen = GetStorage().read(StorageConstants.infoScreen);
  RxString tittle = ''.obs;
  var arguments = Get.arguments;

  FavorListController({this.apiRepository});

  var favorListRequest;
  var listFavor = RxList<FavorListResponse>();

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

  void initialData() async {
    final res = await apiRepository.onPostListFavor(
        '/productOrder/groups/v2/${infoScreen['code']}', FavorListRequest());
    if (res != null) {
      listFavor.value = res;
    }
  }

  void groupByFavorList(
      {String property, FavorListRequest favorListRequest}) async {
    favorListRequest = favorListRequest;
    final res = await apiRepository.onPostListFavor(
        '/productOrder/groups/v2/jobticket',
        favorListRequest ?? FavorListRequest(groupByColumn: property));
    if (res != null) {
      listFavor.value = res;
    }
  }

  void scanRedirectFavor() async {
    helper.scan().then((barcode) => {
          if (barcode != null && barcode != '')
            {Get.toNamed(Routes.FAVOR_DETAIL, arguments: barcode)}
        });
  }

  void scanAddRedirectFavor() async {
    helper.scan().then((barcode) => {
          if (barcode != null && barcode != '')
            {
              Get.toNamed(
                Routes.FAVOR_DETAIL,
                arguments: barcode,
                parameters: {
                  "new": 'new',
                },
              )
            }
        });
  }

  void redirectTo(FavorListResponse favorListResponse) {
    GetStorage().write(StorageConstants.favorListRequest, favorListRequest);
    Get.toNamed(Routes.FAVOR, arguments: favorListResponse.name);
  }
}
