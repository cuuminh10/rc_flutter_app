import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/favor_detail/favor_detail_controller.dart';
import 'package:gmc_app/modules/favor_detail/screens/comment_screen.dart';
import 'package:gmc_app/modules/favor_detail/screens/detail_screen.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/constants/strings.dart';
import 'package:gmc_app/shared/ultis/helper.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_button_svg.dart';
import 'package:gmc_app/shared/widgets/gmc_cupertino_bottom.dart';
import 'package:gmc_app/shared/widgets/gmc_inputField.dart';
import 'package:gmc_app/shared/widgets/gmc_label.dart';
import 'package:gmc_app/shared/widgets/gmc_space.dart';
import 'package:gmc_app/shared/widgets/gmc_tab_button.dart';
import 'package:gmc_app/shared/widgets/gmc_tiles.dart';


class RemarkScreen extends GetView<FavorDetailController> {

  const RemarkScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
          () => controller.favorDetailResponse.value.id != null
          ? SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: CommonWidget.appBar(
              context, controller.favorDetailResponse.value.no, Icons.arrow_back, Colors.black,
              customAction: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Text(
                    StringConstant.DONE,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: ColorConstants.Blue500,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          body: CommonWidget.body(
            child: Container(

            ),
          ),
        ),
      )
          : Container(
        width: 0,
        height: 0,
      ),
    );
  }
}
