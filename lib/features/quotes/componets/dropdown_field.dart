import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/quotes/quote_provider.dart';
import 'package:provider/provider.dart';

class DropdownTextFieldCustom extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String obscuringCharacter;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final dynamic maxLines;
  final dynamic action;
  final dynamic errorText;
  final List<String> items;

  const DropdownTextFieldCustom({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    required this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.enabled = true,
    this.hintStyle,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.obscuringCharacter = '*',
    this.height = 60,
    this.width,
    this.maxLines = 1,
    this.action,
    this.errorText,
    this.backgroundColor,
    required this.items,
  }) : super(key: key);

  @override
  _DropdownTextFieldCustomState createState() =>
      _DropdownTextFieldCustomState();
}

class _DropdownTextFieldCustomState extends State<DropdownTextFieldCustom> {
  String? selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        setState(() {
          if (widget.controller.text.isNotEmpty) {
            selectedValue = widget.controller.text;
            widget.onChanged!(selectedValue ?? '');
          }
        });
      } catch (e) {
        selectedValue = widget.controller.text;
        setState(() {});
        log("Prefile" + e.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool enabled =
        Provider.of<QuoteProvider>(context, listen: false).isAddingQuote;
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width - (widget.width ?? 140),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedValue,

        hint: enabled
            ? Text(
                widget.hintText ?? 'Select an item',
              )
            : null,
        // icon: widget.suffixIcon ?? Icon(Icons.arrow_drop_down),
        icon: enabled
            ? SizedBox(
                width: 20,
                child: widget.suffixIcon ??
                    SvgPicture.asset('assets/icons/dropdown.svg'),
              )
            : SizedBox(),
        onChanged: !enabled
            ? null
            : (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                  widget.controller.text = selectedValue ?? '';
                  context.read<QuoteProvider>().refreshState();
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue!);
                }
              },

        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        style: TextStyle(color: Colors.black),

        decoration: InputDecoration(
          isDense: false,
          contentPadding: EdgeInsets.only(
              left: widget.prefixIcon == null ? 20 : 10, top: 12, bottom: 12),
          hintStyle: widget.hintStyle ??
              TextStyle(
                fontSize: 17,
                color: enabled ? Colors.black.withOpacity(0.6) : Colors.black,
              ),
          enabled:
              Provider.of<QuoteProvider>(context, listen: false).isAddingQuote,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          errorText: widget.errorText,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
        ),
      ),
    );
  }
}
