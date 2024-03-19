import 'package:flutter/material.dart';
import 'package:prime_template/features/navigation/components/bottomNar.dart';
import 'package:prime_template/features/navigation/components/custom_appbar.dart';
import 'package:prime_template/features/quotes/componets/dropdown_field.dart';
import 'package:prime_template/features/quotes/componets/quote_benefits_section.dart';
import 'package:prime_template/features/quotes/componets/quote_info_section.dart';
import 'package:prime_template/features/quotes/componets/quote_setup_section.dart';
import 'package:prime_template/features/quotes/componets/quote_text_field.dart';
import 'package:prime_template/features/quotes/componets/selection_tabs.dart';
import 'package:prime_template/features/quotes/quote_provider.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../authentication/components/textfield.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({super.key});

  @override
  State<QuoteDetails> createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: bgbrownColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Consumer<QuoteProvider>(
            builder: (context, provider, child) {
              bool isQuoteInfo = provider.currentTab == QUOTETABS.QUOTEINFO;
              bool isSetup = provider.currentTab == QUOTETABS.SETUP;
              bool isBenefits = provider.currentTab == QUOTETABS.BENEFITS;
              return SizedBox(
                height: size.height * 1.05,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back_ios)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            provider.isAddingQuote
                                ? "Create Quote"
                                : "View Quote",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: headingColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black.withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<QuoteProvider>()
                                    .toggleQuoteTab(QUOTETABS.QUOTEINFO);
                              },
                              child: selectionTabs(
                                  context, 'Quote Information', isQuoteInfo)),
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<QuoteProvider>()
                                    .toggleQuoteTab(QUOTETABS.SETUP);
                              },
                              child: selectionTabs(context, 'Setup', isSetup)),
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<QuoteProvider>()
                                    .toggleQuoteTab(QUOTETABS.BENEFITS);
                              },
                              child: selectionTabs(
                                  context, 'Benefits', isBenefits)),
                          SizedBox(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (isQuoteInfo) QuoteInfoSection(),
                    if (isSetup) QuoteSetupSection(),
                    if (isBenefits) QuoteBenefitSection(),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: MediaQuery.viewInsetsOf(context).bottom,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
