import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/home/components/dot_and_text.dart';
import 'package:prime_template/features/home/components/home_card_wrapper.dart';
import 'package:prime_template/utils/colors.dart';

class LeadsCard extends StatelessWidget {
  const LeadsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Leads",
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DotAndText(
                text: "Accounts",
                color: primaryColor,
              ),
              DotAndText(
                text: "Insurance",
                color: insuranceColor,
              ),
              DotAndText(
                text: "Credits",
                color: creditColor,
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/charts.svg',
          ),
        ],
      ),
    );
  }
}
