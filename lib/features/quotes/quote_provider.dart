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
    clearControllers();
    notifyListeners();
  }

  QUOTETABS _currentTab = QUOTETABS.QUOTEINFO;
  QUOTETABS get currentTab => _currentTab;
  void toggleQuoteTab(QUOTETABS qtab) {
    if (!_isAddingQuote) {
      _currentTab = qtab;
    } else if (qtab == QUOTETABS.QUOTEINFO) {
      _currentTab = qtab;
    }
    notifyListeners();
  }

  void toggleQuoteTabfree(QUOTETABS qtab) {
    _currentTab = qtab;

    notifyListeners();
  }

  List<dynamic> _selectedBenefits = [];
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference quotes = firestore.collection('quotes');

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
      return quotes.add(quoteData).then((value) {
        showsnack(context, "Quote added with ID: ${value.id}");
        fetchAllQuotes(context);
        // Navigator.pop(context);
        clearControllers();
      }).catchError(
          (error) => showsnack(context, "Failed to add quote: $error"));
    } catch (e) {
      pr.hide();
      showsnack(context, "Failed to add Quote: $e");
    }
  }

  dynamic _quotes;
  get quotes => _quotes;

  Future<void> fetchAllQuotes(context) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference quotesRef = firestore.collection('quotes');
    ProgressDialog pr = ProgressDialog(context);
    pr.show();
    try {
      QuerySnapshot querySnapshot = await quotesRef.get();
      final allQuotes = querySnapshot.docs.map((doc) => doc.data()).toList();
      pr.hide();
      _quotes = allQuotes;
      notifyListeners();
    } catch (e) {
      pr.hide();
      showsnack(context, "Error fetching quotes: $e");
      print("Error fetching quotes: $e");
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
  TextEditingController spouseCoveredController = TextEditingController();
  TextEditingController numberOfChildrenController = TextEditingController();
  TextEditingController coverChildrenController = TextEditingController();
  TextEditingController spouseAgeBracketController = TextEditingController();
//    benefits
  TextEditingController inpatientCoverLimitController = TextEditingController();

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    middleNameController.clear();
    originatingLeadSourceController.clear();
    quoteIdController.clear();
    owningBusinessUnitController.clear();
    leadIdController.clear();
    sourceController.clear();
    capturingUserController.clear();
    ageBracketController.clear();
    inpatientCoverLimitController.clear();
    spouseCoveredController.clear();
    numberOfChildrenController.clear();
    coverChildrenController.clear();
    spouseAgeBracketController.clear();
    inpatientCoverLimitController.clear();
    notifyListeners();
  }

  void refreshState() {
    notifyListeners();
  }

  void prefillControllers(Map<String, dynamic> mapData) {
    firstNameController.text = mapData['firstName'] ?? '';
    lastNameController.text = mapData['lastName'] ?? '';
    middleNameController.text = mapData['middleName'] ?? '';
    originatingLeadSourceController.text =
        mapData['originatingLeadSource'] ?? '';
    quoteIdController.text = mapData['quoteId'] ?? '';
    owningBusinessUnitController.text = mapData['owningBusinessUnit'] ?? '';
    leadIdController.text = mapData['leadId'] ?? '';
    sourceController.text = mapData['source'] ?? '';
    capturingUserController.text = mapData['capturingUser'] ?? '';
    ageBracketController.text = mapData['ageBracket'] ?? '';
    inpatientCoverLimitController.text = mapData['inpatientCoverLimit'] ?? '';
    spouseCoveredController.text = mapData['spouseCovered'] ?? '';
    numberOfChildrenController.text = mapData['numberOfChildren'] ?? '';
    coverChildrenController.text = mapData['coverChildren'] ?? '';
    spouseAgeBracketController.text = mapData['spouseAgeBracket'] ?? '';
    inpatientCoverLimitController.text = mapData['inpatientCoverLimit'] ?? '';
    _selectedBenefits = mapData['benefits'] ?? <String>[];
    _groupValue = mapData['payment'];

    notifyListeners();
  }
}
