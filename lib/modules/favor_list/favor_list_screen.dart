import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/favor_list/favor_list_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_label.dart';
import 'package:gmc_app/shared/widgets/gmc_list_tile.dart';

class FavorListScreen extends GetView<FavorListController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: CommonWidget.body(
          child: Container(
            child: ListView.separated(
                itemCount: controller.listFavor.value.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      height: 10,
                      color: Colors.white,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return GmcListTile(
                    onTapTralling: () => {},
                    tittle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GmcLabel(label: controller.listFavor.value[index].name,fontWeight: FontWeight.bold , color: ColorConstants.Blue800, fontSize: 14.0,),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: ColorConstants.Blue800
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GmcLabel(label: controller.listFavor.value[index].counts.toString(),fontWeight: FontWeight.normal , color: ColorConstants.white, fontSize: 14.0,),
                            ))
                      ],
                    ),
                    iconTralling: 'assets/svg/arrow.svg',
                  );
                }),
          ),
        ),
      ),
    );
  }
}
