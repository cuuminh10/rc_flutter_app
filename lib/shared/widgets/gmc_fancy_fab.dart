import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmc_app/shared/constants/colors.dart';
import 'package:gmc_app/shared/widgets/gmc_svg.dart';

class GmcFancyFab extends StatefulWidget {
  final void Function() onScan;
  final void Function() onScanCreat;

  const GmcFancyFab({
    Key key,
    this.onScan,
    this.onScanCreat,
  }) : super(key: key);

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<GmcFancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  final Curve _curve = Curves.easeOut;
  final double _fabHeight = 56.0;

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: ColorConstants.Orange600,
      end: ColorConstants.Orange600,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget scan() {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: ColorConstants.Orange600,
      onPressed: () => widget.onScan(),
      tooltip: 'Add',
      child: const GmcSVG(
        icon: "assets/svg/Scan.svg",
        color: Colors.white,
      ),
    );
  }

  Widget add() {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: ColorConstants.Orange600,
      onPressed: () => widget.onScanCreat(),
      tooltip: 'Inbox',
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget toggle() {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      child: isOpened
          ? AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              color: Colors.white,
              size: 30,
              progress: _animateIcon,
            )
          : const GmcSVG(
              icon: "assets/svg/paper.svg",
              width: 30,
              height: 30,
              color: Colors.white,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: scan(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: add(),
        ),
        toggle(),
      ],
    );
  }
}
