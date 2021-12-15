import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';

// ignore: must_be_immutable
class CommentBox extends StatelessWidget {
  Widget child;
  dynamic formKey;
  dynamic sendButtonMethod;
  dynamic commentController;
  final Set<void> Function(List<String>) onUpload;
  final Set<void> Function() onPickImage;
  final Set<void> Function() onPickImageFormGallery;
  String userImage;
  String labelText;
  String errorText;
  Widget sendWidget;
  Widget attachWidget;
  Color backgroundColor;
  Color textColor;
  bool withBorder;
  Widget header;
  FocusNode focusNode;

  CommentBox(
      {this.child,
      this.header,
      this.sendButtonMethod,
      this.formKey,
      this.commentController,
      this.sendWidget,
      this.userImage,
      this.labelText,
      this.focusNode,
      this.errorText,
      this.withBorder = true,
      this.backgroundColor,
      this.attachWidget,
      this.textColor,
      this.onPickImage,
      this.onUpload,
      this.onPickImageFormGallery});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        const Divider(
          height: 2,
        ),
        header ?? SizedBox.shrink(),
        ListTile(
          horizontalTitleGap: 1.0,
          tileColor: backgroundColor,
          leading: Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: CircleAvatar(
                radius: 50, backgroundImage: NetworkImage(userImage)),
          ),
          title: Form(
            key: formKey,
            child: TextFormField(
              autofocus: true,
              maxLines: 4,
              minLines: 1,
              focusNode: focusNode,
              cursorColor: textColor,
              style: TextStyle(color: textColor),
              controller: commentController,
              decoration: InputDecoration(
                enabledBorder: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                focusedBorder: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                border: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                labelText: labelText,
                focusColor: textColor,
                fillColor: textColor,
                labelStyle: TextStyle(color: textColor),
              ),
              validator: (value) => value.isEmpty ? errorText : null,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(onTap: sendButtonMethod, child: sendWidget),
              GestureDetector(
                  onTap: () {
                    final act = CupertinoActionSheet(
                        title: Text(
                          'Attachment',
                          style: TextStyle(color: ColorConstants.Blue500),
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text('Document'),
                            onPressed: () {
                              onUpload(['pdf']);
                              Navigator.of(context, rootNavigator: true)
                                  .pop("0");
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Images'),
                            onPressed: () {
                              onPickImageFormGallery();
                              Navigator.of(context, rootNavigator: true)
                                  .pop("1");
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Camera'),
                            onPressed: () {
                              print('pressed');
                              onPickImage();
                              Navigator.of(context, rootNavigator: true)
                                  .pop("2");
                            },
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop("Cancel");
                          },
                        ));
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => act);
                  },
                  child: attachWidget),
            ],
          ),
        ),
      ],
    );
  }
}
