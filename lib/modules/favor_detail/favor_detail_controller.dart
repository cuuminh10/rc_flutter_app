
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gmc_app/routes/app_pages.dart';
import 'package:gmc_app/shared/widgets/gmc_cupertino_bottom.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gmc_app/api/api_repository.dart';
import 'package:gmc_app/models/request/comment_request.dart';
import 'package:gmc_app/models/response/favor_detail_reponse.dart';
import 'package:gmc_app/models/response/favor_reponse.dart';
import 'package:gmc_app/shared/constants/constants.dart';
import 'package:gmc_app/shared/ultis/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavorDetailController extends GetxController {
  final ApiRepository apiRepository;

  FavorDetailController({this.apiRepository});

  RxInt selectedPage = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  final commentTextController = TextEditingController();
  RxBool isOnChange = false.obs;
  RxString reply = ''.obs;
  RxString pathFileComment = ''.obs;
  dynamic infoScreen = GetStorage().read(StorageConstants.infoScreen);
  FavorResponse arguments = Get.arguments;
  RxString tittle = ''.obs;
  Rx<FavorDetailResponse> favorDetailResponse = FavorDetailResponse().obs;
  Rx<Detail> detailItem = Detail().obs;
  var descriptionTextFieldController = TextEditingController();
  RxBool isReadOnlyDescription = false.obs;
  RxString labelButton = ''.obs;
  final qtyTextController = TextEditingController();
  final setUpTextController = TextEditingController();
  final ncrTextController = TextEditingController();
  final cancelTextController = TextEditingController();

  var listDocument = RxList<Document>();




  @override
  void onInit() {
    super.onInit();
    final prefs = Get.find<SharedPreferences>();
    commentTextController.text = '';
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
      listDocument.value = res.listDocument;
      descriptionTextFieldController.value = TextEditingValue(text: res.description);
    }
  }

  void sendComment () async {
   if (commentTextController.text != '') {
     final res = await apiRepository.onPostComment('/fc/comment/${infoScreen['code']}/${favorDetailResponse.value.id}', CommentRequest(content: commentTextController.text));
     if (res != null) {
       listDocument.value.insert(0, Document(comment: res.comment, createUser: res.createUser, createDate: res.createDate ));
       listDocument.refresh();
       commentTextController.text = '';
     }
   }else {
     Get.snackbar('', "Comment can' empty");
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

  void sendAttach (String pathFile) async {

    File file = File(pathFile);
    MultipartFile f = null;
    if (file.exists() != null) {
      f = MultipartFile(await file.readAsBytes(),
          filename: basename(file.path));
    }

    FormData form = FormData({
      if (f != null) 'file': f,
    });

    if (f != null) {
      final res = await apiRepository.onPostAttach('/fc/fileUpload/${infoScreen['code']}/${favorDetailResponse.value.id}', form);
      if (res != null) {
        listDocument.value.insert(0, Document(saveName: res.saveName, realName: res.realName, createUser: res.createUser, createDate: res.createDate, types: 'attach' ));
        listDocument.refresh();
        commentTextController.text = '';
      }
    }else {
      Get.snackbar('', "Comment can' empty");
    }
  }

  void uploadImageGallery({bool before}) async {
    await helper.pickImageFormGallery().then((value) =>
        sendAttach(value)
    );
  }

  void uploadPdf() async{
    var path = await helper.openFileExplorer();
    if (path != null && path != '') {
      sendAttach(path);
    }
  }

  void redirectRemark(Detail detail) async{
   if (infoScreen['remark'] != null && infoScreen['remark'] != '') {
     detailItem.value = detail;
     qtyTextController.text = detail.qty.toString();
     setUpTextController.text = detail.setUpQty.toString();
     ncrTextController.text = detail.ncrQty.toString();
     cancelTextController.text = detail.cancelQty.toString();

     Get.toNamed(infoScreen['remark']);
   }
  }


  Future<Attach> postAttach(String file) async {
    final url = "${dotenv.env['apiBasedURL']}/fc/fileUpload/${infoScreen['code']}/${favorDetailResponse.value.id}";
    var map = new Map<String, dynamic>();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = { "Authorization": 'Bearer ${prefs.getString('token')}'};

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', file));
    request.headers.addAll(headers);

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      // return Attach.fromJsonMap(json.decode(responseString));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load get');
    }
  }
  CupertinoActionSheet cupertinoActionSheets(
      String label, List<GmcCupertinoBottom> list) {
    return CupertinoActionSheet(
      title: Text(
        label,
        style: TextStyle(color: ColorConstants.black),
      ),
      actions: list,
      cancelButton: const GmcCupertinoBottom(lable: 'Cancel'),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}