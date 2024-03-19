import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget CustomAppBar() {
  return AppBar(
    elevation: 0.0,
    leading: Padding(
      padding: EdgeInsetsDirectional.all(8.0),
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
        color: Colors.white,
      ),
    ),
    actions: [
      Image.asset(
        'assets/images/img.png',
        height: 30,
      ),
      SizedBox(
        width: 5,
      ),
      Padding(
        padding: EdgeInsetsDirectional.all(8.0),
        child: SvgPicture.asset('assets/icons/search.svg'),
      ),
      Padding(
        padding: EdgeInsetsDirectional.all(8.0),
        child: SvgPicture.asset('assets/icons/menu.svg'),
      ),
    ],
  );
}
