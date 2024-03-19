import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_template/features/quotes/componets/field_modifiers.dart';
import 'package:prime_template/features/quotes/quote_provider.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:provider/provider.dart';

class QuoteInfoSection extends StatefulWidget {
  const QuoteInfoSection({super.key});

  @override
  State<QuoteInfoSection> createState() => _QuoteInfoSectionState();
}

class _QuoteInfoSectionState extends State<QuoteInfoSection> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: MediaQuery.viewInsetsOf(context),
      child: SizedBox(
        height: size.height - 150,
        child: Consumer<QuoteProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ...titleAndField(
                        'First Name', 'Stacey', provider.firstNameController),
                    ...titleAndField('Middle Name', 'Nyawira',
                        provider.middleNameController),
                    ...titleAndField(
                        'Last Name', 'Waruguru', provider.lastNameController),
                    ...titleAndDropDownField(
                        "Originating Lead Source",
                        ['Lawrence Bii', 'Agent', 'Portal', 'Other'],
                        provider.originatingLeadSourceController),
                    // ...titleAndField('Quote ID', 'QUO-02091-V2C8D9',
                    //     provider.quoteIdController),
                    ...titleAndField('Owning Business Unit', 'Kenya',
                        provider.owningBusinessUnitController),
                    ...titleAndField('Lead ID', '0', provider.leadIdController),
                    ...titleAndDropDownField(
                        "Source",
                        ['Agent portal', ' Sales Agent', "Other"],
                        provider.sourceController),
                    ...titleAndField('Capturing User', 'Jeremy Kibor',
                        provider.capturingUserController),
                    SizedBox(
                      height: 20,
                    ),
                    if (provider.isAddingQuote)
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            context
                                .read<QuoteProvider>()
                                .setIsAddingQuote(false);
                            context
                                .read<QuoteProvider>()
                                .toggleQuoteTab(QUOTETABS.SETUP);
                            context
                                .read<QuoteProvider>()
                                .setIsAddingQuote(true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
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
                                "Setup",
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
                      height: 250,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
