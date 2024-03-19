import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

List<String> names = [
  'John Doe',
  'Jane Smith',
  'Michael Johnson',
  'Sarah Williams',
  'James Brown',
  'Emily Davis',
  'Robert Jones',
  'Laura Miller',
  'William Wilson',
  'Patricia Moore',
  'Charles Anderson',
  'Linda Taylor',
  'Thomas Jackson',
  'Barbara White',
  'Richard Harris',
  'Elizabeth Martin',
  'David Thomas',
  'Jennifer Thompson',
  'Joseph Garcia',
  'Maria Martinez',
];
List<String> benefits = [
  'Inpatient',
  'outpatient',
  'No Co-Payment',
  "Dental",
  'Optical',
  'Maternity',
  'Last Expense',
  'Personal Accident',
  'Enhanced Covid 19 Cover',
  'Amref Evacuation',
];
void goToLTR(context, page) {
  Navigator.push(
    context,
    PageTransition(
        type: PageTransitionType.leftToRight,
        duration: Duration(milliseconds: 300),
        child: page),
  );
}

void goToRTL(context, page) {
  Navigator.push(
    context,
    PageTransition(
        type: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 300),
        child: page),
  );
}

void showsnack(context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
