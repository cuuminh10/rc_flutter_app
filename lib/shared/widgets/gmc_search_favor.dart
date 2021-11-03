import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmc_app/models/request/favor_list_request.dart';
import 'package:gmc_app/shared/constants/colors.dart';

class GmcSearchFavor extends StatefulWidget {
  final Widget child;
  final void Function(FavorListRequest favorListRequest) onGroupBy;

  GmcSearchFavor({Key key, this.child, this.onGroupBy})
      : assert(child.key != null),
        super(key: key);

  @override
  _MyPopupMenuState createState() => _MyPopupMenuState();
}

class _MyPopupMenuState extends State<GmcSearchFavor> {
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
            onGroupBy: this.widget.onGroupBy,
            onAction: (x) {},
          );
        });
  }
}

class PopupMenuContent extends StatefulWidget {
  final Offset position;
  final Size size;
  final ValueChanged<String> onAction;
  final void Function(FavorListRequest favorListRequest) onGroupBy;

  const PopupMenuContent(
      {Key key, this.position, this.size, this.onAction, this.onGroupBy})
      : super(key: key);

  @override
  _PopupMenuContentState createState() => _PopupMenuContentState();
}

class _PopupMenuContentState extends State<PopupMenuContent>
    with SingleTickerProviderStateMixin {
  //Let's create animation
  AnimationController _animationController;
  Animation<double> _animation;
  String dropdownValue = '';
  TextEditingController _phaseTextFieldController = TextEditingController();
  TextEditingController _woTextFieldController = TextEditingController();
  TextEditingController _wcTextFieldController = TextEditingController();

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
                  top: widget.position.dy + 100,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: const Offset(1.0, 2.0),
                        child: Opacity(opacity: _animation.value, child: child),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        margin: EdgeInsets.only(left: 10, right: 10),
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
                          children: [
                            //Repeat now
                            GestureDetector(
                              onTap: () => _closePopup("repeatNow"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE9FFE3),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(
                                      Icons.task_alt_rounded,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Text('Status'),
                                      value: dropdownValue,
                                      // icon: const Icon(Icons.arrow_downward),
                                      iconSize: 40,
                                      // elevation: 30,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        '',
                                        'Open',
                                        'Overdue',
                                        'Incomplete',
                                        'Complete'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Edit workout
                            SizedBox(
                              height: 16,
                            ),

                            GestureDetector(
                              onTap: () => _closePopup("editWorkout"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E1FC),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Color(0xFF3840A2),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextField(
                                        style: TextStyle(
                                            color: ColorConstants.Blue500),
                                        controller: _phaseTextFieldController,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                new UnderlineInputBorder(
                                                    borderSide: new BorderSide(
                                                        color: ColorConstants
                                                            .Blue100)),
                                            labelStyle: TextStyle(
                                                color: ColorConstants.Blue800,
                                                fontWeight: FontWeight.bold),
                                            hintText: 'Input search phase...',
                                            labelText: 'Phase')),
                                  ),
                                ],
                              ),
                            ),
                            //Share workout
                            SizedBox(
                              height: 16,
                            ),

                            GestureDetector(
                              onTap: () => _closePopup("Work Order"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDDF3FD),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(
                                      Icons.work,
                                      color: Color(0xFF0586C0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextField(
                                        style: TextStyle(
                                            color: ColorConstants.Blue500),
                                        controller: _woTextFieldController,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                new UnderlineInputBorder(
                                                    borderSide: new BorderSide(
                                                        color: ColorConstants
                                                            .Blue100)),
                                            labelStyle: TextStyle(
                                                color: ColorConstants.Blue800,
                                                fontWeight: FontWeight.bold),
                                            hintText:
                                                'Input search Work Order...',
                                            labelText: 'Work Order')),
                                  ),
                                ],
                              ),
                            ),

                            //Share workout
                            SizedBox(
                              height: 16,
                            ),

                            GestureDetector(
                              onTap: () => _closePopup("Work Center"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDDF2FD),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(
                                      Icons.description,
                                      color: Color(0xFF0550C0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextField(
                                        style: TextStyle(
                                            color: ColorConstants.Blue500),
                                        controller: _wcTextFieldController,
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                new UnderlineInputBorder(
                                                    borderSide: new BorderSide(
                                                        color: ColorConstants
                                                            .Blue100)),
                                            labelStyle: TextStyle(
                                                color: ColorConstants.Blue800,
                                                fontWeight: FontWeight.bold),
                                            hintText:
                                                'Input search Work Center...',
                                            labelText: 'Work Center')),
                                  ),
                                ],
                              ),
                            ),
                            //Share workout
                            SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: NormalButton(
                                  text: 'Search',
                                  onPress: () => {
                                    this.widget.onGroupBy(FavorListRequest(
                                        status: dropdownValue,
                                        phase:
                                        _phaseTextFieldController.text,
                                        workOrder:
                                        _woTextFieldController.text,
                                        workCenter:
                                        _wcTextFieldController.text))
                                  },
                                  vertical: 15,
                                  horizontal: 20,
                                  width: 0.5),
                            ),
                            //Share workout
                            SizedBox(
                              height: 16,
                            ),
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
      ),
    );
  }

  void _closePopup(String action) {
    _animationController.reverse().whenComplete(() {
      Navigator.of(context).pop();

      if (action.isNotEmpty) widget.onAction?.call(action);
    });
  }
}

class NormalButton extends StatelessWidget {
  final String text;
  final Set<void> Function() onPress;
  final double vertical;
  final double horizontal;
  final double width;

  const NormalButton({
    Key key,
    this.text,
    this.onPress,
    this.vertical,
    this.horizontal,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
          color:  ColorConstants.Blue800,
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: ColorConstants.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
