import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GmcInputSearch extends StatelessWidget {
  final void Function(String) onChange;
  final TextEditingController controller;

  const GmcInputSearch({
    Key key,
    this.onChange,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      height: 60.0,
      child: TextField(
          autofocus: true,
          controller: controller,
          onChanged: (e) => onChange(e),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 7, bottom: 6),
            border: OutlineInputBorder(),
            hintText: 'Type here...',
            prefixIcon: Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 5, right: 0, bottom: 10),
              child: SizedBox(
                child: SvgPicture.asset(
                  "assets/svg/search.svg",
                ),
              ),
            ),
          ),
          style: TextStyle(fontSize: 18.0, height: 2.0, color: Colors.black, fontWeight: FontWeight.normal)),
    );
  }
}
