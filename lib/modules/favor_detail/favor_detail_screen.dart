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

class FavorDetailScreen extends GetView<FavorDetailController> {
  @override
  Widget build(BuildContext context) {
    final gmcCupertinoCamera = List<GmcCupertinoBottom>()
      ..add(GmcCupertinoBottom(lable: StringConstant.camera))
      ..add(GmcCupertinoBottom(
        lable: StringConstant.photoFromCamera,
        onPressed: () => controller.uploadImageGallery(before: true),
      ));

    SizeConfig().init(context);
    return Obx(
      () => controller.favorDetailResponse.value.id != null
          ? SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: CommonWidget.appBar(
                    context, '', Icons.arrow_back, Colors.black,
                    customAction: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text(
                          controller.infoScreen['actionAppbBar'],
                          style: TextStyle(
                              fontSize: 16.0,
                              color: ColorConstants.Blue500,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                body: CommonWidget.body(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: ColorConstants.Gray6),
                                  color: ColorConstants.Gray6),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GmcLabel(
                                  label:
                                      controller.favorDetailResponse.value.no,
                                  color: ColorConstants.Blue800,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GmcLabel(
                                label: '•',
                                color: ColorConstants.Gray3,
                                fontSize: 14.0,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: ColorConstants.Blue800),
                                color: ColorConstants.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorConstants.Gray6,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GmcLabel(
                                  label:
                                      controller.favorDetailResponse.value.woNo,
                                  color: ColorConstants.Blue800,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        GmcSpace(
                          height: SizeConfig().screenHeight * 0.01,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GmcLabel(
                            label: controller
                                .favorDetailResponse.value.jobTicketNo,
                            color: ColorConstants.darkHeading,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GmcSpace(
                          height: SizeConfig().screenHeight * 0.01,
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: GmcTiles(
                              colorIcon: ColorConstants.darkHeading,
                              labelExpandedValue:
                                  controller.infoScreen['label_topLeft'],
                              labelSubTittleValue:
                                  controller.favorDetailResponse.value.phaseNo,
                              iconSvg: 'assets/svg/phase.svg',
                              radius: 0.0,
                              paddingIcon: 0.0,
                              colorBorder: ColorConstants.warning,
                            )),
                            Flexible(
                                child: GmcTiles(
                              colorIcon: ColorConstants.darkHeading,
                              labelExpandedValue:
                                  controller.infoScreen['label_topRight'],
                              labelSubTittleValue: controller
                                  .favorDetailResponse.value.workCenterName,
                              iconSvg: 'assets/svg/work_center.svg',
                              radius: 0.0,
                              paddingIcon: 0.0,
                              colorBorder: ColorConstants.warning,
                            ))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: GmcTiles(
                              colorIcon: ColorConstants.darkHeading,
                              labelExpandedValue:
                                  controller.infoScreen['label_bottomLeft'],
                              labelSubTittleValue: 'Create by',
                              iconSvg: 'assets/svg/defectIcon.svg',
                              radius: 0.0,
                              paddingIcon: 4.0,
                              colorBorder: ColorConstants.warning,
                              widgetLeading: Text(
                                helper.cutName(controller
                                    .favorDetailResponse.value.employeeName),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            )),
                            Flexible(
                                child: GmcTiles(
                              colorIcon: ColorConstants.darkHeading,
                              labelExpandedValue:
                                  controller.infoScreen['label_bottomRight'],
                              labelSubTittleValue: helper.ConvertDateTime(
                                  controller.favorDetailResponse.value.ordDate),
                              iconSvg: 'assets/svg/due_date.svg',
                              radius: 0.0,
                              paddingIcon: 0.0,
                              colorBorder: ColorConstants.warning,
                            ))
                          ],
                        ),
                        GmcSpace(
                          height: SizeConfig().screenHeight * 0.01,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GmcLabel(
                                label: 'Description',
                                color: ColorConstants.Blue800,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              TextField(
                                  style:
                                      TextStyle(color: ColorConstants.Blue500),
                                  readOnly: !controller.infoScreen['editDesc'],
                                  controller:
                                      controller.descriptionTextFieldController,
                                  showCursor: true,
                                  decoration: InputDecoration(
                                      enabledBorder: new UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: ColorConstants.Blue100)),
                                      labelStyle: TextStyle(
                                          color: ColorConstants.Blue800,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                        GmcSpace(
                          height: SizeConfig().screenHeight * 0.01,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              GmcTabButton(
                                text: 'Details',
                                pageNumber: 0,
                                selectedPage: controller.selectedPage.value,
                                onPressed: () => {controller.changePage(0)},
                                fontSize: 14.0,
                                padding: 0,
                                margin: 0,
                              ),
                              GmcTabButton(
                                text: 'Comments',
                                pageNumber: 1,
                                selectedPage: controller.selectedPage.value,
                                onPressed: () => {controller.changePage(1)},
                                fontSize: 14.0,
                                padding: 0,
                                margin: 0,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: SizeConfig().screenWidth,
                            child: PageView(
                              onPageChanged: (int) {
                                controller.changePage(int);
                              },
                              controller: controller.pageController.value,
                              children: [
                                DetailScreen(),
                                CommentScreen(
                                  onSwipedMessage: controller.replyFunction,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: controller.selectedPage == 1
                    ? Transform.translate(
                        offset: Offset(
                            0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: BottomAppBar(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const GmcButtonSvg(
                                    iconSvg: 'assets/svg/mention.svg'),
                                GmcSpace(
                                  width: SizeConfig().screenWidth * 0.01,
                                ),
                                GmcButtonSvg(
                                    iconSvg: 'assets/svg/attach.svg', onPressed: () => controller.uploadPdf(),),
                                GmcSpace(
                                  width: SizeConfig().screenWidth * 0.01,
                                ),
                                 GmcButtonSvg(
                                    iconSvg: 'assets/svg/camera.svg', onPressed: () => {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          controller.cupertinoActionSheets(
                                              StringConstant.options,
                                              gmcCupertinoCamera))
                                },),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        controller.reply.value.trim().isEmpty
                                            ? 0.0
                                            : 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: ColorConstants.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorConstants.Gray6,
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (controller.reply.value
                                            .trim()
                                            .isNotEmpty)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: const Flexible(
                                                    child: Text('133123')),
                                              ),
                                              GestureDetector(
                                                onTap: () => {},
                                                child: Icon(
                                                  Icons.clear,
                                                  color: ColorConstants.black,
                                                  size: 24.0,
                                                  semanticLabel:
                                                      'Text to announce in accessibility modes',
                                                ),
                                              )
                                            ],
                                          ),
                                        if (controller.reply.value
                                            .trim()
                                            .isNotEmpty)
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: 4.0, top: 4.0),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: Border(
                                              bottom: BorderSide(
                                                //                    <--- top side
                                                color: ColorConstants.Gray6,
                                              ),
                                            )),
                                            child: GmcSpace(
                                              height:
                                                  SizeConfig().screenHeight *
                                                      0.01,
                                            ),
                                          ),
                                        GmcInputField(
                                          color: ColorConstants.black,
                                          controller:
                                              controller.commentTextController,
                                          keyboardType: TextInputType.text,
                                          placeholder: 'Aa',
                                          borderNone: controller.reply.value
                                                  .trim()
                                                  .isEmpty
                                              ? false
                                              : true,
                                          fontSize: 18.0,
                                          onChange: (text) {},
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () => controller.sendComment(),
                                    child: Container(
                                      height: SizeConfig().screenHeight * 0.08,
                                      width: SizeConfig().screenWidth * 0.2,
                                      decoration: BoxDecoration(
                                          gradient: gradient(
                                              controller.isOnChange.value),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[500],
                                              offset: Offset(0.0, 1.5),
                                              blurRadius: 1.5,
                                            ),
                                          ]),
                                      child: Center(
                                        child: Text(
                                          StringConstant.send,
                                          style: TextStyle(
                                              color: ColorConstants.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            )
          : Container(
              width: 0,
              height: 0,
            ),
    );
  }
}
