import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MyColors.dart';

class IconTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final EdgeInsets? margin;
  final TextInputType? type;
  final Widget? icon;
  final Widget? suffix;
  final bool? isPassword;
  final Widget? prefix;
  final String? prefixText;
  final Function(String value)? validate;
  final Color? filledColor;
  final TextInputAction? action;
  final Function(String value)? submit;
  // final Function(String)? onChange;

  IconTextFiled(
      {this.label,
      this.icon,
      this.controller,
      this.margin,
      this.type,
      this.action,
      this.submit,
      this.prefixText,
      this.isPassword = false,
      this.prefix,
      this.filledColor,
      this.validate,
      // this.onChange,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 50,
            maxHeight: 80,
            minWidth: double.infinity,
            maxWidth: double.infinity),
        child: TextFormField(
          controller: controller,
          keyboardType: type ?? TextInputType.text,
          enabled: true,
          obscureText: isPassword ?? false,
          textInputAction: action ?? TextInputAction.next,
          onFieldSubmitted: submit,
          // onChanged: onChange,
          enableSuggestions: true,
          enableInteractiveSelection: true,
          autofocus: false,
          style: GoogleFonts.cairo(fontSize: 14),
          validator: (value) => validate!(value!),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyColors.primary.withOpacity(.7), width: 1),
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
              // hintText: "$label",
              hintStyle: GoogleFonts.cairo(fontSize: 14),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              suffixIcon: suffix,
              prefixIcon: icon,
              filled: true,
              fillColor: filledColor ?? Colors.white),
        ),
      ),
    );
  }
}
