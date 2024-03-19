import 'package:flutter/material.dart';

class HomeCardWrapper extends StatelessWidget {
  final child;
  const HomeCardWrapper({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * .65,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(8),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
