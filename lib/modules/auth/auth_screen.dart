import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/models/response/info_server_response.dart';
import 'package:gmc_app/modules/welcome/welcome_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/constants/strings.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_button.dart';
import 'package:gmc_app/shared/widgets/gmc_inputField.dart';
import 'package:gmc_app/shared/widgets/gmc_label.dart';
import 'package:gmc_app/shared/widgets/gmc_space.dart';

import 'auth_controller.dart';

class AuthScreen extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CommonWidget.body(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo_expert_erp.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: controller.loginFormKey,
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GmcInputField(
                            color: ColorConstants.Blue800,
                            controller: controller.loginEmailController,
                            keyboardType: TextInputType.text,
                            placeholder: 'Username',
                            fontSize: 18.0,
                            prefixIcon: Icons.forward_to_inbox,
                            onChange: (text) {
                              controller.handleOnChangeController();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username is required.';
                              }
                              return null;
                            },
                          ),
                          GmcSpace(
                            height: SizeConfig().screenHeight * 0.01,
                          ),
                          GmcInputField(
                            password: controller.isVisiblePassword.value,
                            color: ColorConstants.Blue800,
                            controller: controller.loginPasswordController,
                            keyboardType: TextInputType.text,
                            placeholder: 'Password',
                            onPress: () {
                              controller.isVisiblePassword.value =
                                  !controller.isVisiblePassword.value;
                            },
                            onChange: (text) {
                              controller.handleOnChangeController();
                            },
                            fontSize: 18.0,
                            prefixIcon: Icons.lock_outline_sharp,
                            suffixIcon: !controller.isVisiblePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required.';
                              }
                              return null;
                            },
                          ),
                          GmcSpace(
                            height: SizeConfig().screenHeight * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: ColorConstants.Blue800,
                                    spreadRadius: 1),
                              ],
                            ),
                            width: SizeConfig().screenWidth,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('Server'),
                              value:  controller.dropdownValue.value,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  fontSize: 16, color: ColorConstants.Blue800),
                              underline: SizedBox(),
                              onChanged: (String server) {
                                controller.changeServer(server);
                              },
                              items: controller.listServer.value.map((InfoServerResponse e) =>
                                   DropdownMenuItem<String>(
                                    value: e.serverName,
                                    child: Text(e.serverName),
                                  )
                              ).toList(),
                            ),
                          ),
                          GmcSpace(
                            height: SizeConfig().screenHeight * 0.08,
                          ),
                          GmcRaisedGradientButton(
                              child: Text(
                            StringConstant.signIn,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Mulish',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                              onPressed: () {
                                  controller.login(context);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
