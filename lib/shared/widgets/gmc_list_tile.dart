import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gmc_app/shared/constants/colors.dart';

import 'gmc_svg.dart';

class GmcListTile extends StatelessWidget {
  final String iconLeading;
  final Widget tittle;
  final String iconTralling;
  final void Function() onTapItem;
  final void Function() onTapTralling;

  const GmcListTile({
    Key key,
    this.iconLeading,
    this.tittle,
    this.iconTralling,
    this.onTapItem,
    this.onTapTralling,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapItem != null ? onTapItem() : null,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: ColorConstants.Blue100,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            leading: iconLeading != null
                ? GmcSVG(
                    icon: iconLeading,
                  )
                : null,
            title: tittle,
            trailing: GestureDetector(
              onTap: onTapTralling != null ? () => onTapTralling() : null,
              child: GmcSVG(
                icon: iconTralling,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
