import 'package:get/get.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/models/response/favor_list_response.dart';
import 'package:gmc_app/routes/app_pages.dart';

class FavorListController extends GetxController {
  final ApiRepository apiRepository;

  FavorListController({this.apiRepository});

  var listFavor =  RxList<FavorListResponse>();


  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initialData() async{
    final res = await apiRepository.onPostListFavor('/productOrder/groups/v2/jobticket', FavorListRequest());
    if (res != null) {
      listFavor.value = res;
    }
  }
}
