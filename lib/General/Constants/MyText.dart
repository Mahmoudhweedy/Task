import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String? title;
  Color? color = Colors.black;
  double? size = 12;
  TextAlign? alien = TextAlign.start;
  TextDecoration? decoration = TextDecoration.none;
  TextOverflow? overflow;
  bool? isNumber;
  FontWeight? fontWeight;
  bool? softWrap;
  int? maxLines;

  MyText(
      {this.title,
      this.color,
      this.maxLines,
      this.size,
      this.softWrap,
      this.alien,
      this.decoration,
      this.overflow,
      this.isNumber = false,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: alien,
      textScaleFactor: 1.2,
      softWrap: softWrap,
      maxLines: maxLines,
      style: context.locale.languageCode == "ar"
          ? GoogleFonts.cairo(
              color: color,
              fontSize: size,
              decoration: decoration,
              fontWeight: fontWeight)
          : GoogleFonts.abel(
              color: color,
              fontSize: size,
              decoration: decoration,
              fontWeight: fontWeight),
      overflow: overflow,
    );
  }
}
