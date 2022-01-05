import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/General/Providers/PaymentProvider.dart';
import './../Constants/MyColors.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainData {
  static ThemeData defaultThem = ThemeData(
    scaffoldBackgroundColor: MyColors.bg,
    primarySwatch: Colors.grey,
    textSelectionTheme: TextSelectionThemeData(cursorColor: MyColors.primary),
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    platform: TargetPlatform.android,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(subtitle1: GoogleFonts.cairo(fontSize: 14)),
    pageTransitionsTheme: PageTransitionsTheme(
        builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()}),
  );

  static List<SingleChildWidget> providers(BuildContext context) => [
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
      ];
}
