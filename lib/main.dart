import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:task/General/Providers/PaymentProvider.dart';
import 'package:task/General/utilities/CachHelper.dart';
import 'package:task/General/utilities/MainData.dart';
import 'package:task/user/Splash.dart';

// import 'genaral/widgets/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await CachHelper.init();
  runApp(EasyLocalization(
    supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
    path: 'assets/langs',
    fallbackLocale: Locale('ar', 'EG'),
    startLocale: Locale('ar', 'EG'),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaymentProvider>(
      create: (_) => PaymentProvider(),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'hala',
        theme: MainData.defaultThem,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Splash(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
