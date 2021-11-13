import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/modules/favor_detail/favor_detail_controller.dart';
import 'package:gmc_app/shared/ultis/helper.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_message.dart';
import 'package:swipe_to/swipe_to.dart';

class CommentScreen extends GetView<FavorDetailController> {
  final ValueChanged<String> onSwipedMessage;

  const CommentScreen({Key key, this.onSwipedMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Obx(
      () => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: controller.listDocument.value
                .map(
                  (element) => SwipeTo(
                  onRightSwipe: () =>
                      onSwipedMessage(element.comment),
                  child: GmcMessage(
                    tittle: element.createUser,
                    content: element.comment,
                    date: helper.ConvertDateTime(
                        element.createDate),
                    nameUser: helper
                        .cutName(element.createUser),
                    comment: element,
                  )),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}
