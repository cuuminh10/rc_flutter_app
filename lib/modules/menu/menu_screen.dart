import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/welcome/welcome_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/constants/strings.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_tab_button.dart';
import 'package:gmc_app/shared/widgets/widgets.dart';

import 'menu_controller.dart';

class MenuScreen extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Obx(
        ()=> Scaffold(
          backgroundColor: ColorConstants.white,
          body: CommonWidget.body(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: SizeConfig().screenWidth * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: ColorConstants.Blue800
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GmcTabButton(
                          text: StringConstant.shortcut,
                          pageNumber: 0,
                          selectedPage: controller.selectedPage.value,
                          boxDecoration: true,
                          alignment: Alignment.center,
                          onPressed: () => {controller.changePage(0)},
                        ),
                        GmcTabButton(
                          text: StringConstant.all,
                          pageNumber: 1,
                          selectedPage: controller.selectedPage.value,
                          boxDecoration: true,
                          alignment: Alignment.center,
                          onPressed: () => {controller.changePage(1)},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: PageView(
                        onPageChanged: (int) {
                          controller.changePage(int);
                        },
                        controller: controller.pageController.value,
                        children: [
                          GmcGridView(
                            height: SizeConfig().screenHeight,
                            crossAxisCount: 2,
                            childAspectRatioX: 5,
                            childAspectRatioY: 4,
                            listWidget: List.generate(
                                controller.listFavor.value.length,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () => controller.redirectTo(controller.listFavor.value[index]),
                                    child: GmcCard(
                                      horizontal: 10.0,
                                      color: ColorConstants.Blue100,
                                      background: ColorConstants.Blue100,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GmcSVG(
                                            icon: controller.getNameImageModule(controller.listFavor.value[index]),
                                          ),
                                          GmcSpace(
                                            height: SizeConfig().screenHeight * 0.01,
                                          ),
                                          GmcLabel(
                                            color: ColorConstants.Blue800,
                                            fontSize: 16.0,
                                            fontFamily: 'Mulish',
                                            label: controller.getFullNameModule(controller.listFavor.value[index]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GmcLabel(label: 'Production',fontWeight: FontWeight.normal , color: ColorConstants.Blue500,),
                              GmcSpace(height: SizeConfig().screenHeight * 0.02,),
                              Flexible(
                                child: Container(
                                  child: ListView.separated(
                                      itemCount: controller.listProduction.value.length,
                                      separatorBuilder: (BuildContext context, int index) => const Divider(height: 10, color: Colors.white,),
                                      itemBuilder: (BuildContext context, int index) {
                                        var item = controller.listProduction.value[index];
                                        return GmcListTile(
                                          onTapItem: () => controller.redirectTo(item),
                                          onTapTralling:() => controller.onTapButtonMenu(controller.listProduction.value[index]),
                                          iconLeading: controller.listProduction.value[index].image,
                                          tittle: Text(controller.listProduction.value[index].name),
                                          iconTralling: controller.checkContainsFavor(controller.listProduction.value[index]) ? 'assets/svg/enable_add.svg' : 'assets/svg/disable_add.svg',
                                        );
                                      }
                                  ),
                                ),
                              ),
                              GmcLabel(label: 'Purchase',fontWeight: FontWeight.normal , color: ColorConstants.Blue500,),
                              GmcSpace(height: SizeConfig().screenHeight * 0.02,),
                              Flexible(
                                child: Container(
                                  child: ListView.separated(
                                      itemCount: controller.listPurchase.value.length,
                                      separatorBuilder: (BuildContext context, int index) => const Divider(height: 10, color: Colors.white,),
                                      itemBuilder: (BuildContext context, int index) {
                                        return GmcListTile(
                                          onTapTralling:() => controller.onTapButtonMenu(controller.listPurchase.value[index]),
                                          iconLeading: controller.listPurchase.value[index].image,
                                          tittle: Text(controller.listPurchase.value[index].name),
                                          iconTralling: controller.checkContainsFavor(controller.listPurchase.value[index]) ? 'assets/svg/enable_add.svg' : 'assets/svg/disable_add.svg',
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
