import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmc_app/models/response/favor_detail_reponse.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/ultis/helper.dart';
import 'package:gmc_app/shared/ultis/size_config.dart';

import 'gmc_space.dart';

class GmcMessage extends StatelessWidget {
  final String nameUser;
  final String tittle;
  final String date;
  final String content;
  final String reply;
  final String subTittle;
  final Comment comment;

  const GmcMessage(
      {Key key,
        @required this.nameUser,
        @required this.tittle,
        @required this.date,
        @required this.content,
        this.reply, this.subTittle, this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          leading: GestureDetector(
            onTap: () async {
              // Display the image in large form.
              print("Comment Clicked");
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              child: CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: const Text('V'),
              ),
            ),
          ),
          title: Text(
            tittle,
            style: TextStyle(
                fontWeight: FontWeight.normal, color: ColorConstants.black),
          ),
          subtitle:  Text(date),
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (reply != null) const Text('12/10/2010'),
              if (reply != null)
                Container(
                  margin: EdgeInsets.only(bottom: 4.0, top: 4.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          //                    <--- top side
                          color: ColorConstants.Gray6,
                        ),
                      )),
                  child: GmcSpace(
                    height: SizeConfig().screenHeight * 0.01,
                  ),
                ),

              helper.typeOfComment(comment)
            ],
          ),
        )
      ],
    );
  }
}
