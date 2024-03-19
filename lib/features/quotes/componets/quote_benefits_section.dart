import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/quotes/componets/field_modifiers.dart';
import 'package:prime_template/features/quotes/quote_provider.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:provider/provider.dart';

class QuoteBenefitSection extends StatefulWidget {
  const QuoteBenefitSection({super.key});

  @override
  State<QuoteBenefitSection> createState() => _QuoteBenefitSectionState();
}

class _QuoteBenefitSectionState extends State<QuoteBenefitSection> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height - 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<QuoteProvider>(
          builder: (context, provider, child) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  ...titleAndDropDownField(
                      "Inpatient Cover Limit",
                      [
                        'KES 250,000',
                        'KES 500,000',
                        'KES 1,000,000',
                        'KES 1,500,000',
                      ],
                      TextEditingController()),
                  Container(
                    width: size.width - 30,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Benefits",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: headingColor,
                            ),
                          ),
                        ),
                        ...benefits.map((benefit) {
                          bool toggled =
                              provider.selectedBenefits.contains(benefit);
                          return Column(
                            children: [
                              ...benefitTile(context, benefit, toggled)
                            ],
                          );
                        }).toList(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width - 30,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: primaryColor1, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Premium Summary",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: headingColor,
                                ),
                              ),
                              SvgPicture.asset('assets/icons/info.svg'),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: headingColor,
                                ),
                              ),
                              Text(
                                "KES 131,435",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: headingColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('M-PESA PayBill'),
                              Image.asset(
                                'assets/images/mpesa.png',
                                height: 50,
                                width: 70,
                              ),
                            ],
                          ),
                          value: 'mpesa',
                          groupValue: provider.groupValue,
                          onChanged: (String? value) {
                            context
                                .read<QuoteProvider>()
                                .setGroupValue(value ?? '');
                          },
                        ),
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Credit / Debit Card'),
                              Image.asset(
                                'assets/images/visa.png',
                                height: 50,
                                width: 70,
                              ),
                            ],
                          ),
                          value: 'card',
                          groupValue: provider.groupValue,
                          onChanged: (String? value) {
                            context
                                .read<QuoteProvider>()
                                .setGroupValue(value ?? '');
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<QuoteProvider>()
                                  .addQuoteToFirebase(context);
                              context
                                  .read<QuoteProvider>()
                                  .toggleQuoteTab(QUOTETABS.QUOTEINFO);
                            },
                            child: Container(
                              height: 36,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primaryColor1),
                              ),
                              child: Center(
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(color: primaryColor1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> benefitTile(context, benefit, toggled) {
    return [
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            benefit,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: headingColor,
            ),
          ),
          Container(
            height: 30,
            width: 35,
            child: Transform.scale(
              transformHitTests: false,
              scale: 0.7,
              child: CupertinoSwitch(
                value: toggled,
                activeColor: primaryColor,
                onChanged: (value) {
                  Provider.of<QuoteProvider>(context, listen: false)
                      .addBenefit(benefit);
                },
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Divider(),
    ];
  }
}
