import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prime_template/features/authentication/auth_provider.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';

enum QUOTETABS {
  QUOTEINFO,
  SETUP,
  BENEFITS,
}

class QuoteProvider extends ChangeNotifier {
  bool _isAddingQuote = false;
  get isAddingQuote => _isAddingQuote;
  void setIsAddingQuote(val) {
    _isAddingQuote = val;
    notifyListeners();
  }

  QUOTETABS _currentTab = QUOTETABS.QUOTEINFO;
  QUOTETABS get currentTab => _currentTab;
  void toggleQuoteTab(QUOTETABS qtab) {
    if (!_isAddingQuote) {
      _currentTab = qtab;
    }
    notifyListeners();
  }

  void toggleQuoteTabfree(QUOTETABS qtab) {
    _currentTab = qtab;

    notifyListeners();
  }

  List<String> _selectedBenefits = [];
  get selectedBenefits => _selectedBenefits;
  void addBenefit(benefit) {
    if (_selectedBenefits.contains(benefit)) {
      _selectedBenefits.remove(benefit);
    } else {
      _selectedBenefits.add(benefit);
    }
    notifyListeners();
  }

  String _groupValue = '';
  get groupValue => _groupValue;
  void setGroupValue(val) {
    _groupValue = val;
    notifyListeners();
  }

  Future<void> addQuoteToFirebase(context) async {
    ProgressDialog pr = ProgressDialog(context);
    pr.show();
    DatabaseReference quotesRef =
        FirebaseDatabase.instance.reference().child('quotes');

    try {
      Map<String, dynamic> quoteData = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'middleName': middleNameController.text,
        'originatingLeadSource': originatingLeadSourceController.text,
        'quoteId': quoteIdController.text,
        'owningBusinessUnit': owningBusinessUnitController.text,
        'leadId': leadIdController.text,
        'source': sourceController.text,
        'capturingUser': capturingUserController.text,
        'ageBracket': ageBracketController.text,
        'inpatientCoverLimit': inpatientCoverLimitController.text,
        'spouseCovered': spouseCoveredController.text,
        'numberOfChildren': numberOfChildrenController.text,
        'coverChildren': coverChildrenController.text,
        'spouseAgeBracket': spouseAgeBracketController.text,
        'inpatientCoverLimit': inpatientCoverLimitController.text,
        'benefits': _selectedBenefits,
        'payment': groupValue,
      };
      pr.hide();
      Navigator.of(context).pop();
      showsnack(context, "Quote Added");
      // return quotesRef
      //     .push()
      //     .set(quoteData)
      //     .then((value) => showsnack(context, "Quote added"))
      //     .catchError(
      //         (error) => showsnack(context, "Failed to add quote: $error"));
    } catch (e) {
      pr.hide();
      showsnack(context, "Failed to add Quote: $e");
    }
  }

//   Text Editing controllers

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController originatingLeadSourceController =
      TextEditingController();
  TextEditingController quoteIdController = TextEditingController();
  TextEditingController owningBusinessUnitController = TextEditingController();
  TextEditingController leadIdController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController capturingUserController = TextEditingController();
//   setup
  TextEditingController ageBracketController = TextEditingController();
  TextEditingController inpatientCoverLimitController = TextEditingController();
  TextEditingController spouseCoveredController = TextEditingController();
  TextEditingController numberOfChildrenController = TextEditingController();
  TextEditingController coverChildrenController = TextEditingController();
  TextEditingController spouseAgeBracketController = TextEditingController();
//    benefits
  TextEditingController innpatientCoverLimitController =
      TextEditingController();
}
