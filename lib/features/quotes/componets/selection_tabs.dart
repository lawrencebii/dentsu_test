import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prime_template/utils/colors.dart';

Widget selectionTabs(
  context,
  title,
  selected,
) {
  return Container(
    constraints:
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: selected
                  ? TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )
                  : TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selected ? primaryColor : Colors.transparent,
              ),
              child: !selected
                  ? SizedBox()
                  : Text(
                      title,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ],
        );
      },
    ),
  );
}
