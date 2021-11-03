import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gmc_space.dart';

class GmcSortPopup extends StatefulWidget {
  final Widget child;
  final Map<String, String> listSort;
  final void Function(String) callbackGroupBy;

  GmcSortPopup({Key key, this.child, this.listSort, this.callbackGroupBy})
      : assert(child.key != null),
        super(key: key);

  @override
  _RocezSortPopup createState() => _RocezSortPopup();
}

class _RocezSortPopup extends State<GmcSortPopup> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onTap: _showPopupMenu,
    );
  }

  void _showPopupMenu() {
    //Find renderbox object
    RenderBox renderBox = (widget.child.key as GlobalKey)
        .currentContext
        ?.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);

    showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopupMenuContent(
            position: position,
            size: renderBox.size,
            listSort: this.widget.listSort,
            onAction: (x) {
              this.widget.callbackGroupBy(x);
            },
          );
        });
  }
}

class PopupMenuContent extends StatefulWidget {
  final Offset position;
  final Size size;
  final ValueChanged<String> onAction;
  final Map<String, String> listSort;

  const PopupMenuContent(
      {Key key, this.position, this.size, this.onAction, this.listSort})
      : super(key: key);

  @override
  _PopupMenuContentState createState() => _PopupMenuContentState();
}

class _PopupMenuContentState extends State<PopupMenuContent>
    with SingleTickerProviderStateMixin {
  //Let's create animation
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _closePopup("");
        return false;
      },
      child: GestureDetector(
        onTap: () => _closePopup(""),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right:
                      (MediaQuery.of(context).size.width - widget.position.dx) -
                          widget.size.width,
                  top: widget.position.dy + 50,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        alignment: Alignment.topRight,
                        child: Opacity(opacity: _animation.value, child: child),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        margin: EdgeInsets.only(left: 150),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 8,
                              )
                            ]),
                        child: Column(
                            children: List.generate(
                          this.widget.listSort.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: itemSort(
                                this.widget.listSort.keys.elementAt(index),
                                this.widget.listSort.values.elementAt(index)),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _closePopup(String action) {
    _animationController.reverse().whenComplete(() {
      Navigator.of(context).pop();

      if (action.isNotEmpty) widget.onAction?.call(action);
    });
  }

  Widget itemSort(String lalel, String property) => GestureDetector(
        onTap: () => _closePopup(property),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xFFFDFBDD),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                Icons.event,
                color: Color(0xFFC06605),
              ),
            ),
            GmcSpace(
              width: 12,
            ),
            Text(
              lalel,
              style: TextStyle(
                  color: Colors.black.withOpacity(.7),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
}
