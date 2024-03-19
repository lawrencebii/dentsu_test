import 'package:flutter/material.dart';
import 'package:prime_template/features/quotes/componets/field_modifiers.dart';
import 'package:prime_template/features/quotes/quote_provider.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:provider/provider.dart';

class QuoteSetupSection extends StatefulWidget {
  const QuoteSetupSection({super.key});

  @override
  State<QuoteSetupSection> createState() => _QuoteSetupSectionState();
}

class _QuoteSetupSectionState extends State<QuoteSetupSection> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height - 150,
      child: Consumer<QuoteProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ...titleAndDropDownField(
                      "Age Bracket",
                      [
                        '18 to 30 years',
                        '31 to 45 years',
                        '46 to 60 years',
                        '60+ years'
                      ],
                      provider.ageBracketController),
                  ...titleAndDropDownField(
                      "Inpatient Cover Limit",
                      [
                        'KES 250,000',
                        'KES 500,000',
                        'KES 1,000,000',
                        'KES 1,500,000',
                      ],
                      provider.inpatientCoverLimitController),
                  ...titleAndDropDownField(
                      "Spouse Covered",
                      [
                        'Yes',
                        'No',
                      ],
                      provider.spouseCoveredController),
                  ...titleAndDropDownField(
                      "How many children?",
                      [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                      ],
                      provider.numberOfChildrenController),
                  ...titleAndDropDownField(
                      "Cover Children",
                      [
                        'Yes',
                        'No',
                      ],
                      provider.coverChildrenController),
                  ...titleAndDropDownField(
                      "Spouse Age Bracket",
                      [
                        '18 to 30 years',
                        '31 to 45 years',
                        '46 to 60 years',
                        '60+ years'
                      ],
                      provider.spouseAgeBracketController),
                  SizedBox(
                    height: 40,
                  ),
                  if (provider.isAddingQuote)
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          context.read<QuoteProvider>().setIsAddingQuote(false);
                          context
                              .read<QuoteProvider>()
                              .toggleQuoteTab(QUOTETABS.BENEFITS);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          context.read<QuoteProvider>().setIsAddingQuote(true);
                        }
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
                            Text(
                              "Benefits",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
