import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:prime_template/utils/constants.dart';

class LeadTile extends StatelessWidget {
  final index;
  final cname;
  const LeadTile({super.key, this.index, this.cname});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
            names[index],
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
