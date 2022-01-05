import 'package:flutter/material.dart';
import 'package:task/General/Constants/MyRoute.dart';
import 'package:task/General/Models/RegisterModel.dart';
import 'package:task/General/Resources/DioHelper.dart';
import 'package:task/General/utilities/GlobalState.dart';
import 'package:task/user/Auth/LoginScreen.dart';
import 'package:task/user/Home.dart';

class AuthData {
  bool hidePassword = false;
  bool hideConfirmPassword = false;
  TextEditingController fullName = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool hideLoginPassword = false;
  TextEditingController loginMail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  List<String> roles = ['admin'];
  final formKey = GlobalKey<FormState>();

  void registerUser(BuildContext context) async {
    RegisterModel _model = RegisterModel(
      email: mail.text,
      fullName: fullName.text,
      password: password.text,
      roles: roles,
    );

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await DioHelper().post('User/RegisterUser', _model.toJson());
      fullName.clear();
      mail.clear();
      password.clear();
      MyRoute().navigate(context: context, route: LoginScreen());
    }
  }

  void loginUser(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      await DioHelper().post('User/Login',
          {"email": "${loginMail.text}", "password": "${loginPassword.text}"}).then((value) => GlobalState.instance.set('token', value['dateSet']['token']));
      loginMail.clear();
      loginPassword.clear();
      MyRoute().navigateAndRemove(context: context, route: Home());

    }
  }
}
