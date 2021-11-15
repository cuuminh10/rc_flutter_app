import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/favor_detail/favor_detail_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/constants/strings.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_label.dart';
import 'package:gmc_app/shared/widgets/gmc_label_button.dart';
import 'package:gmc_app/shared/widgets/gmc_space.dart';

class RemarkScreen extends GetView<FavorDetailController> {
  const RemarkScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => controller.detailItem.value != null
          ? SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: CommonWidget.appBar(
                    context, '', Icons.arrow_back, Colors.black,
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
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GmcLabel(
                          label: 'Item' ' ' +
                              controller.detailItem.value.productNo.toString(),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: ColorConstants.Blue500,
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(bottom: SizeConfig().screenHeight * 0.01),
                          child: GmcSpace(
                            height: SizeConfig().screenHeight * 0.01,
                            border: ColorConstants.Blue500,
                          ),
                        ),
                        GmcLabel(
                          label:
                              'Phase' ' '+controller.detailItem.value.phaseName.toString(),
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: ColorConstants.Blue500,
                        ),
                        GmcSpace(
                          height: SizeConfig().screenHeight * 0.02,
                        ),
                        GmcLabel(
                          label:
                          StringConstant.DETAIL,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: ColorConstants.black,
                        ),
                        GmcSpace(
                          height: SizeConfig().screenHeight * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorConstants.white,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorConstants.Blue100, spreadRadius: 1),
                            ],
                          ),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: IntrinsicColumnWidth(),
                              2: FlexColumnWidth(2),
                              3: IntrinsicColumnWidth(),
                            },
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: ColorConstants.Blue100,
                                              width: 1))),
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabel(
                                          label: StringConstant.QTY,
                                          color: ColorConstants.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabelButton(
                                          label: '-',
                                          color: ColorConstants.Blue500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: ColorConstants.Blue500, fontWeight: FontWeight.normal),
                                          controller: controller.qtyTextController,
                                          decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: "Hint here"),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabelButton(
                                          label: '+',
                                          color: ColorConstants.Blue500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: ColorConstants.Blue100,
                                              width: 1))),
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabel(
                                          label: StringConstant.SET_UP_QTY,
                                          color: ColorConstants.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabelButton(
                                          label: '-',
                                          color: ColorConstants.Blue500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: ColorConstants.Blue500, fontWeight: FontWeight.normal),
                                          controller: controller.setUpTextController,
                                          decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: "Hint here"),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabelButton(
                                          label: '+',
                                          color: ColorConstants.Blue500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: ColorConstants.Blue100,
                                              width: 1))),
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabel(
                                          label: StringConstant.NCR_QTY,
                                          color: ColorConstants.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabelButton(
                                          label: '-',
                                          color: ColorConstants.Blue500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: ColorConstants.Blue500, fontWeight: FontWeight.normal),
                                          controller: controller.ncrTextController,
                                          decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: "Hint here"),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: GmcLabelButton(
                                          label: '+',
                                          color: ColorConstants.Blue500,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),                                    child: GmcLabel(
                                        label: StringConstant.CANCEL_QTY,
                                        color: ColorConstants.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),                                    child: GmcLabelButton(
                                        label: '-',
                                        color: ColorConstants.Blue500,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: ColorConstants.Blue500, fontWeight: FontWeight.normal),
                                          controller: controller.cancelTextController,
                                          decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: "Hint here"),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),                                    child: GmcLabelButton(
                                        label: '+',
                                        color: ColorConstants.Blue500,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
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
