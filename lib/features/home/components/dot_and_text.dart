import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotAndText extends StatelessWidget {
  final text;
  final color;
  const DotAndText({super.key, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          margin: EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 12,
              ),
              children: [
                TextSpan(
                    text: text, style: TextStyle(fontWeight: FontWeight.w400)),
                // TextSpan(text: '1.7K')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
