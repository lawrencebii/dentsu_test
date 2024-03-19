import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_template/utils/colors.dart';

import 'home_card_wrapper.dart';

class TotalLeads extends StatelessWidget {
  const TotalLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCardWrapper(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Leads",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/dots_menu.svg',
                color: primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 130,
              width: 130,
              child: Stack(
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      backgroundColor: brownColor,
                      value: .60,
                      color: primaryColor,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "60%",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: primaryColor,
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
                    children: const [
                      TextSpan(
                          text: "Contacted ",
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      TextSpan(text: '1.7K')
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: brownColor,
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
                    children: const [
                      TextSpan(
                          text: "Total Leads ",
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      TextSpan(text: '2.7K')
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
