import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gmc_app/models/response/favor_detail_reponse.dart';
import 'package:gmc_app/routes/app_pages.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/constants/storage.dart';
import 'package:gmc_app/shared/ultis/size_config.dart';
import 'package:gmc_app/shared/widgets/gmc_space.dart';
import 'package:gmc_app/shared/widgets/gmc_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class helper {
  static const String ProductionOrdr = 'ProductionOrdr';
  static const String ProductionFG = 'ProductionFG';
  static String Jobticket = 'jobticket';
  static const String attach = 'attach';
  static dynamic infoScreen = GetStorage().read(StorageConstants.infoScreen);


  static dynamic filterScreensGMC(String codeScreen) {
    var data = null;

    switch (codeScreen) {
      case ProductionOrdr:
        data = {};
        data['name'] = 'Job Ticket';
        data['code'] = 'jobticket';
        data['label_topLeft'] = 'Phase';
        data['label_topRight'] = 'Work Center';
        data['label_bottomLeft'] = 'Pic By';
        data['label_bottomRight'] = 'Due Date';
        data['editDesc'] = false;
        data['actionAppbBar'] = 'Result';
        data['screen'] = Routes.FAVOR_LIST;
        break;
      case ProductionFG:
        data = {};
        data['name'] = 'Production Result';
        data['code'] = 'producResult';
        data['label_topLeft'] = 'Phase';
        data['label_topRight'] = 'Work Center';
        data['label_bottomLeft'] = 'Pic By';
        data['label_bottomRight'] = 'Due Date';
        data['editDesc'] = true;
        data['actionAppbBar'] = 'Save';
        data['screen'] = Routes.FAVOR;
        break;
    }

    return data;
  }

  static String FilterImage (String moduleName)  {

    switch(moduleName) {
      case 'ProductionOrdr':
        return 'assets/svg/Jobticket.svg';
      case 'ProductionFG':
        return 'assets/svg/product-ressult.svg';
      case 'POPurchaseReceipt':
        return 'assets/svg/GoodReceiptRequest.svg';
      case 'FGReceipt':
        return 'assets/svg/paper.svg';
      case 'PR':
        return 'assets/svg/Purchase_Request.svg';
      case 'PO':
        return 'assets/svg/purchase-order.svg';
      default:
        return 'assets/svg/paper.svg';
    }
  }

  static String FilterName (String moduleName)  {

    switch(moduleName) {
      case 'ProductionOrdr':
        return 'Job Ticket';
      case 'ProductionFG':
        return 'Production Result';
      case 'POPurchaseReceipt':
        return 'Good Receipt Request';
      case 'FGReceipt':
        return 'Good Receipt';
      case 'PR':
        return 'Purchase Request';
      case 'PO':
        return 'Purchase Order';
      default:
        return 'Approval Form';
    }
  }

  static String ConvertDateTime (String dateString)  {
    if (dateString == null) {
      return "";
    }
    var inputDate = DateTime.parse(dateString);
    String output = DateFormat('d/MM/yyyy').format(inputDate);
    return output;
  }

  static String cutName(String name) {
    if (name != null && name.trim().isNotEmpty &&  name.split("").length > 0) {
      var nameArr = name.split("");
      String nameCut = nameArr[0].toUpperCase();
      return nameCut;
    }
    return "";
  }

  static Future<String> pickImageFormGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        print(image.path);
        return image.path;
      }
    } catch (exception) {
      // log('Take photo error');
    }
  }

  static Future<String> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image != null) {
        return image.path;
      }
    } catch (exception) {
      // log('Take photo error');
    }
  }

  static String getNameImage(String name) {
    if (name.trim().isNotEmpty &&  !name.contains('https')) {
      name = dotenv.env['apiBasedURL'] + "/PMTaskDocs/ViewDocument?file="+name;
    }
    return name;
  }

  static bool isPdf(String path) {
    if (path.contains('.pdf')) {
      return true;
    }
    return false;
  }

  static Future<String> openFileExplorer() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      return result.files[0].path;
    } else {
      // User canceled the picker
    }
  }



  static Widget typeOfComment (Comment comment) {
    switch (comment.types) {
      case attach:
        try {
          if (isPdf(comment.realName)) {
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 100,
                    height: 150,
                    child:const GmcSVG(
                      icon: "assets/svg/xlsx.svg",
                    ),
                  ),
                ),
                GmcSpace(height: SizeConfig().screenHeight * 0.01),
                Text(
                  comment.comment,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: ColorConstants.black, fontSize: 15),
                )
              ],
            );
          }else {
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${dotenv.env['apiBasedURL']}/fc/viewFile/${infoScreen['code']}/${comment.saveName}',
                  fit: BoxFit.fill,
                  height: 200,
                  width: 100,
                  alignment: Alignment.center,
                ),
                GmcSpace(height: SizeConfig().screenHeight * 0.01),
                Text(
                  comment.comment,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: ColorConstants.black, fontSize: 15),
                )
              ],
            );
          }
        }catch(e){
          return  Text(
            comment.comment,
            style: TextStyle(
                fontWeight: FontWeight.normal, color: ColorConstants.black, fontSize: 15),
          );
        }
        break;
      default:
        return  Text(
          comment.comment,
          style: TextStyle(
              fontWeight: FontWeight.normal, color: ColorConstants.black, fontSize: 15),
        );
    }
  }
}