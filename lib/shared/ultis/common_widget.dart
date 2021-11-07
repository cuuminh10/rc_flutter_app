import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gmc_app/shared/widgets/gmc_input_search.dart';
import 'package:gmc_app/shared/widgets/gmc_search_favor.dart';
import 'package:gmc_app/shared/widgets/gmc_sort_popup.dart';
import 'package:gmc_app/shared/widgets/gmc_svg.dart';

class CommonWidget {
  static AppBar appBar(
      BuildContext context, String title, IconData backIcon, Color color,
      {void Function() callback, void Function(String) callbackGroupBy ,Map<String,String> listSort, void Function() callbackSearch, void Function(dynamic) callbackSearchModel, Widget customAction}) {
    return AppBar(
      actions: [
        if (callbackSearch != null && callbackSearchModel == null)
          IconButton(
            icon: GmcSVG(
              icon: 'assets/svg/search.svg',
            ),
            onPressed: () {
              callbackSearch();
            },
          ),
        if (callbackSearchModel != null)
          GmcSearchFavor(
              child: Icon(
                Icons.search,
                key: GlobalKey(),
                color: Colors.black87,
                size: 30,
              ),
              onGroupBy:  callbackSearchModel),
       if (callbackGroupBy != null)
          GmcSortPopup(
            child: Icon(
              Icons.sort_by_alpha_outlined,
              key: GlobalKey(),
              color: Colors.black87,
              size: 30,
            ),
            listSort: listSort,
            callbackGroupBy: callbackGroupBy,
          ),

        if (customAction !=null)
          customAction
      ],
      leading: backIcon == null
          ? null
          : IconButton(
        icon: Icon(backIcon, color: color),
        onPressed: () {
          if (callback != null) {
            callback();
          } else {
            Navigator.pop(context);
          }
        },
      ),
      titleSpacing: 0.0,
      centerTitle: false,
      title: Transform(
        transform:
        Matrix4.translationValues(backIcon == null ? -40.0 : 0.0, 0.0, 0.0),
        child: Text(
          title,
          style: TextStyle(color: color, fontFamily: 'Rubik'),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static Widget body({Container child, bool showSearch = false, TextEditingController controller, void Function(String) onChange}) {
    return Column(
      children: [
        if (showSearch)
          GmcInputSearch(
            controller: controller,
            onChange: onChange,
          ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0), child: child),
        )
      ],
    );
  }

  static SizedBox rowHeight({double height = 30}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static void toast(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
