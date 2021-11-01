import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/welcome/welcome_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.Blue800,
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/images/gmc_icon.png'),
                    width: 80,
                    height: 80),
                const Text('GMC',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'EXPERT ERP-SMART SOLUTION',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
