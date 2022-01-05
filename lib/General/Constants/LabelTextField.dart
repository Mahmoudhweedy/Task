import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MyColors.dart';

// ignore: must_be_immutable
class LabelTextField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  EdgeInsets? margin = EdgeInsets.all(0);
  bool? isPassword = false;
  TextInputType? type = TextInputType.text;
  Function(String value)? onChange;
  final Function(String value)? validate;

  LabelTextField({
    required this.label,
    this.controller,
    this.margin,
    this.isPassword,
    this.type,
    this.onChange,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: margin,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        // onChanged: (value) => onChange!(value),
        obscureText: isPassword!,
        validator: (value) => validate!(value!),
        style: GoogleFonts.cairo(fontSize: 14),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black.withOpacity(.7), width: 1),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primary, width: 1)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red.withOpacity(.7), width: 1),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            hintText: "$label",
            hintStyle: GoogleFonts.cairo(fontSize: 14),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
