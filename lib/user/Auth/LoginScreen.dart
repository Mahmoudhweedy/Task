import 'package:flutter/material.dart';
import 'package:task/General/Constants/DefaultButton.dart';
import 'package:task/General/Constants/IconTextFiled.dart';
import 'package:task/General/Constants/MyColors.dart';
import 'package:task/General/Constants/MyRoute.dart';
import 'package:task/General/Constants/MyText.dart';
import 'package:task/General/utilities/SizeConfig.dart';
import 'package:task/General/utilities/Validator.dart';
import 'package:task/user/Auth/RegisterData.dart';
import 'Register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthData _data = AuthData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.bg,
          image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.fitHeight,
              opacity: .3),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _data.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: SizeConfig.screenHeight! * .1),
                Hero(
                  tag: 'splash',
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    height: SizeConfig.screenHeight! * .12,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * .2),
                MyText(title: 'البريد الالكتروني'),
                IconTextFiled(
                  controller: _data.loginMail,
                  validate: (value) => Validator().validateEmail(value: value),
                ),
                SizedBox(height: SizeConfig.screenHeight! * .03),
                MyText(title: 'كلمة المرور'),
                IconTextFiled(
                  controller: _data.loginPassword,
                  isPassword: !_data.hideLoginPassword,
                  validate: (value) =>
                      Validator().validatePassword(value: value),
                  suffix: GestureDetector(
                    onTap: () => setState(() =>
                        _data.hideLoginPassword = !_data.hideLoginPassword),
                    child: _data.hideLoginPassword
                        ? Icon(Icons.visibility_off_rounded)
                        : Icon(Icons.visibility_rounded),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * .04),
                DefaultButton(
                  child: MyText(
                    title: 'دخول',
                    color: Colors.white,
                    size: 14,
                  ),
                  onTap: () => _data.loginUser(context),
                  color: MyColors.primary,
                ),
                SizedBox(height: SizeConfig.screenHeight! * .04),
                DefaultButton(
                  child: MyText(
                    title: 'تسجيل',
                    color: Colors.white,
                    size: 14,
                  ),
                  onTap: () => MyRoute()
                      .navigate(context: context, route: RegisterScreen()),
                  color: MyColors.secondary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // onButtonTapped() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     // await auth.login(_mail.text, _password.text, context);
  //     CachHelper.saveData(key: "userName", value: _mail.text);
  //     print(CachHelper.getData(key: "userName"));
  //   }
  // }
}
