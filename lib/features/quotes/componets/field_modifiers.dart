import 'package:flutter/material.dart';
import 'package:prime_template/features/quotes/componets/dropdown_field.dart';
import 'package:prime_template/features/quotes/componets/quote_text_field.dart';

List<Widget> titleAndField(name, hint, controller) {
  return [
    Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: name,
            ),
          ],
        ),
      ),
    ),
    SizedBox(
      height: 10,
    ),
    TextFormFieldCustom1(
      obscureText: false,
      obscuringCharacter: '*',
      validator: (value) => value!.isEmpty ? "Please enter $name" : null,
      hintText: hint,
      controller: controller,
      onChanged: (text) {},
    ),
    SizedBox(
      height: 20,
    ),
  ];
}

List<Widget> titleAndDropDownField(name, items, controller) {
  return [
    Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: name,
            ),
          ],
        ),
      ),
    ),
    SizedBox(
      height: 10,
    ),
    DropdownTextFieldCustom(
      validator: (value) => value!.isEmpty ? "Please select $name" : null,
      controller: TextEditingController(),
      hintText: "Select $name",
      items: items,
    ),
    SizedBox(
      height: 20,
    )
  ];
}
