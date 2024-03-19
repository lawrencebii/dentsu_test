import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_template/utils/colors.dart';

class QuoteTile extends StatelessWidget {
  final index;
  final cname;
  const QuoteTile({super.key, this.index, this.cname});
  String getStringFromMap(map, key) {
    try {
      return map[key];
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var map = cname;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: size.width,
      decoration: BoxDecoration(
        color: index.isOdd ? bgbrownColor : Colors.white,
      ),
      child: Row(
        children: [
          Text(
            "0$index",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: headingColor,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            getStringFromMap(map, 'firstName'),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: headingColor,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            getStringFromMap(map, 'middleName'),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: headingColor,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            getStringFromMap(map, 'lastName'),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: headingColor,
            ),
          ),
        ],
      ),
    );
  }
}
