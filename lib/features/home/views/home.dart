import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/home/components/dot_and_text.dart';
import 'package:prime_template/features/home/components/home_card_wrapper.dart';
import 'package:prime_template/features/home/components/lead_tile.dart';
import 'package:prime_template/features/home/components/leads.dart';
import 'package:prime_template/features/home/components/total_leads_card.dart';
import 'package:prime_template/utils/colors.dart';

import '../../navigation/components/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: bgbrownColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Dasboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: headingColor,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TotalLeads(),
                    LeadsCard(),
                    TotalLeads(),
                    LeadsCard(),
                    TotalLeads(),
                    LeadsCard(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "New Leads",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: headingColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Text(
                  "New Leads",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: headingColor,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text(
                      "#",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: headingColor,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Customer Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: headingColor,
                      ),
                    ),
                  ],
                ),
              ),
              ...List.generate(
                  9,
                  (index) => LeadTile(
                        index: index + 1,
                        cname: '',
                      )),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
