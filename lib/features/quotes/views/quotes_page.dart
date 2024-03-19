import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/home/components/lead_tile.dart';
import 'package:prime_template/features/leads/views/quote_detail.dart';
import 'package:prime_template/features/navigation/components/custom_appbar.dart';
import 'package:prime_template/features/quotes/quote_provider.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:provider/provider.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: bgbrownColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Quotes",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: headingColor,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<QuoteProvider>()
                            .toggleQuoteTabfree(QUOTETABS.QUOTEINFO);
                        context.read<QuoteProvider>().setIsAddingQuote(true);

                        goToRTL(context, QuoteDetails());
                      },
                      child: Container(
                        height: 38,
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "New Quote",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/dots_menu.svg',
                      color: primaryColor,
                    ),
                  ],
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
                  "Quotes",
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
                  (index) => GestureDetector(
                        onTap: () {
                          context.read<QuoteProvider>().setIsAddingQuote(false);
                          goToRTL(context, QuoteDetails());
                        },
                        child: LeadTile(
                          index: (index + 1),
                          cname: '',
                        ),
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
