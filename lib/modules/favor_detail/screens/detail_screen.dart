import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/favor_detail/favor_detail_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_label.dart';
import 'package:gmc_app/shared/widgets/gmc_space.dart';

class DetailScreen extends GetView<FavorDetailController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(controller.favorDetailResponse.value.listDetail.length, (index) =>
            GestureDetector(
              onTap: () => {},
              child: Container(
                margin: EdgeInsets.only(bottom: SizeConfig().screenHeight * 0.02),
                padding: EdgeInsets.all(5.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorConstants.white,
                    boxShadow: [
                      BoxShadow(
                          color: ColorConstants.Blue500,
                          spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GmcLabel(
                            label: controller.favorDetailResponse.value.listDetail[index].productNo.toString(),
                            color: ColorConstants.Blue500,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          GmcLabel(
                            label: controller.favorDetailResponse.value.listDetail[index].qty.toString(),
                            color: ColorConstants.Blue500,
                            fontSize: 14.0,
                          )
                        ],
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
                        label: controller.favorDetailResponse.value.listDetail[index].productName,
                        color: ColorConstants.Blue500,
                        fontSize: 14.0,
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
                        label: controller.favorDetailResponse.value.listDetail[index].phaseName,
                        color: ColorConstants.Blue500,
                        fontSize: 14.0,
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
                        label: controller.favorDetailResponse.value.listDetail[index].unit,
                        color: ColorConstants.Blue500,
                        fontSize: 14.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
        )
      ),
    );
  }
}
