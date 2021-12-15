import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmc_app/models/response/favor_detail_reponse.dart';
import 'package:gmc_app/modules/favor_detail/favor_detail_controller.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/ultis/helper.dart';
import 'package:gmc_app/shared/ultis/ultis.dart';
import 'package:gmc_app/shared/widgets/gmc_comment_box.dart';
import 'package:gmc_app/shared/widgets/gmc_message.dart';
import 'package:gmc_app/shared/widgets/widgets.dart';
import 'package:swipe_to/swipe_to.dart';

class CommentScreen extends GetView<FavorDetailController> {
  final ValueChanged<String> onSwipedMessage;

  const CommentScreen({Key key, this.onSwipedMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget commentChild(List<Document> data) {
      return ListView(
          children: controller.listDocument.value
              .map(
                (element) => SwipeTo(
                    onRightSwipe: () => onSwipedMessage(element.comment),
                    child: GmcMessage(
                      tittle: element.createUser,
                      content: element.comment,
                      date: helper.ConvertDateTime(element.createDate),
                      nameUser: helper.cutName(element.createUser),
                      comment: element,
                    )),
              )
              .toList());
    }

    // return Obx(
    //   () => Container(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: ListView(
    //         children: controller.listDocument.value
    //             .map(
    //               (element) => SwipeTo(
    //                   onRightSwipe: () => onSwipedMessage(element.comment),
    //                   child: GmcMessage(
    //                     tittle: element.createUser,
    //                     content: element.comment,
    //                     date: helper.ConvertDateTime(element.createDate),
    //                     nameUser: helper.cutName(element.createUser),
    //                     comment: element,
    //                   )),
    //             )
    //             .toList(),
    //       ),
    //     ),
    //   ),
    // );

    return Obx(() => Container(
          child: CommentBox(
            userImage:
                "https://www.focus2move.com/wp-content/uploads/2020/01/Tesla-Roadster-2020-1024-03.jpg",
            child: controller.listDocument.value.length > 0
                ? commentChild(controller.listDocument.value)
                : Container(
                    height: SizeConfig().screenHeight * 0.4,
                    margin: EdgeInsets.only(top: 70.0),
                    child: Image.asset(
                      "assets/images/comment-place-holder.png",
                      alignment: Alignment.topCenter,
                    )),
            labelText: 'Write a comment...',
            errorText: 'Comment cannot be blank',
            sendButtonMethod: () {
              if (controller.formKey.currentState.validate()) {
                print(controller.commentController.text);
                // ProductOrderDetail productOrderDetail =
                //     this.widget.productOrderDetail;

                // _fileCommentBloc.add(postComment(
                //     type: 'jobticket',
                //     no: productOrderDetail.id.toString(),
                //     content: commentController.text));
                controller.commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: controller.formKey,
            commentController: controller.commentController,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            sendWidget:
                const Icon(Icons.send_sharp, size: 30, color: Colors.white),
            attachWidget: const Icon(Icons.attach_file_outlined,
                size: 30, color: Colors.white),
            onUpload: (e) => {},
            onPickImage: () => {},
            onPickImageFormGallery: () => {},
          ),
        ));
  }
}
