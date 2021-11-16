import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/ultis/helper.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_fancy_fab.dart';
import 'package:gmc_app/shared/widgets/gmc_label.dart';
import 'package:gmc_app/shared/widgets/gmc_list_tile.dart';
import 'package:gmc_app/shared/widgets/gmc_space.dart';
import 'package:gmc_app/shared/widgets/gmc_svg.dart';

import 'favor_controller.dart';

class FavorScreen extends GetView<FavorController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: CommonWidget.appBar(
          context,
          controller.tittle.value,
          Icons.arrow_back,
          Colors.black,
          callbackSearch: () => controller.onClickSearch()
          // callbackSearch: () => controller.onClickSearch()
        ),
        body: CommonWidget.body(
          showSearch: controller.showInputSearch.value,
          controller: controller.searchController,
          onChange: (e) => controller.onChangeSearch(e),
          child: Container(
            child: ListView.separated(
                itemCount: controller.listFavorSearch.length,
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 10,
                  color: Colors.white,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final favorItem = controller.listFavorSearch.value[index];
                  return GmcListTile(
                    onTapItem: () => controller.redirectTo(favorItem),
                    tittle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GmcSVG(
                          icon: 'assets/svg/paper.svg',
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GmcLabel(label: favorItem.no,fontWeight: FontWeight.bold , color: ColorConstants.Blue800, fontSize: 14.0,),
                            GmcSpace(height: SizeConfig().screenHeight * 0.01),
                            GmcLabel(label: favorItem.phaseName,fontWeight: FontWeight.bold , color: ColorConstants.Blue800, fontSize: 14.0,),
                            GmcSpace(height: SizeConfig().screenHeight * 0.01),
                            GmcLabel(label: helper.ConvertDateTime(favorItem.productDate),fontWeight: FontWeight.normal , color: ColorConstants.Blue800, fontSize: 14.0,),
                          ],
                        )
                      ],
                    ),
                    iconTralling: 'assets/svg/arrow.svg',
                  );
                }),
          ),
        ),
        floatingActionButton:  GmcFancyFab(
          onScan: () => controller.scanRedirectFavor(),
          onScanCreat: () => controller.scanAddRedirectFavor(),
        ),
      ),
    );
  }
}
