import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:task/General/Constants/MyColors.dart';
import 'package:task/General/Constants/MyRoute.dart';
import 'package:task/General/Constants/MyText.dart';
import 'package:task/General/Constants/MyToast.dart';
import 'package:task/user/Auth/LoginScreen.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView() {
    return SpinKitCubeGrid(
      color: MyColors.primary,
      size: 40.0,
    );
  }

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "تأكيد");
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
            "قم بتسجيل الدخول للمتابعة",
            () => MyRoute().navigateAndRemove(context: context, route: LoginScreen()),
            context,
            "دخول");
      },
    );
  }

  static Widget _alertDialog(
      String title, Function confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: MyText(
        title: title,
        size: 12,
        color: Colors.black,
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: MyText(
            title: "رجوع",
            size: 12,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: MyText(
            title: okText,
            size: 12,
            color: Colors.black,
          ),
          onPressed: confirm(),
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, Alignment? alignment}) {
    MyToast().showToast(msg, Colors.red);
  }

 
}
