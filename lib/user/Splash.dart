import 'package:flutter/material.dart';
import 'package:task/General/Constants/AnimationContainer.dart';
import 'package:task/General/Constants/MyColors.dart';
import 'package:task/General/Constants/MyRoute.dart';
import 'package:task/General/utilities/CachHelper.dart';
import 'package:task/General/utilities/SizeConfig.dart';
import 'package:task/user/Auth/LoginScreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String token = CachHelper.getData(key: "token") ?? "";
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () async {
      // if (token != "") {
      //   MyRoute().navigateAndRemove(context: context, route: Home());
      // } else {
      MyRoute().navigateAndRemove(context: context, route: LoginScreen());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.bg,
          image: DecorationImage(
            image: AssetImage('assets/images/splash.jpg'),
            fit: BoxFit.fitHeight,
            opacity: .3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimationContainer(
              index: 1,
              distance: 100,
              vertical: false,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Hero(
                  tag: 'splash',
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    height: SizeConfig.screenHeight! * .12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
