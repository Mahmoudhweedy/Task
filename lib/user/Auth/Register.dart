import 'package:flutter/material.dart';
import 'package:task/General/Constants/DefaultButton.dart';
import 'package:task/General/Constants/IconTextFiled.dart';
import 'package:task/General/Constants/MyColors.dart';
import 'package:task/General/Constants/MyText.dart';
import 'package:task/General/Constants/SimpleDropDown.dart';
import 'package:task/General/utilities/SizeConfig.dart';
import 'package:task/General/utilities/Validator.dart';
import 'package:task/user/Auth/RegisterData.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            key: _data.formKey,
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
                MyText(title: 'الاسم'),
                IconTextFiled(
                  controller: _data.fullName,
                  validate: (value)=> Validator().validateEmpty(value: value),
                ),
                MyText(title: 'البريد الالكتروني'),
                IconTextFiled(
                  controller: _data.mail,
                  type: TextInputType.emailAddress,
                  validate: (value) => Validator().validateEmail(value: value),
                ),
                MyText(title: 'كلمة المرور'),
                IconTextFiled(
                  controller: _data.password,
                  isPassword: !_data.hidePassword,
                  validate: (value) => Validator().validatePassword(value: value),
                  suffix: GestureDetector(
                    onTap: () => setState(
                        () => _data.hidePassword = !_data.hidePassword),
                    child: !_data.hidePassword
                        ? Icon(Icons.visibility_off_rounded)
                        : Icon(Icons.visibility_rounded),
                  ),
                ),
                MyText(title: 'تأكيد المرور'),
                IconTextFiled(
                  isPassword: !_data.hideConfirmPassword,
                  validate: (value) =>
                      Validator().validatePasswordConfirm(confirm: value,pass: _data.password.text),
                  suffix: GestureDetector(
                    onTap: () => setState(() => _data.hideConfirmPassword =
                        !_data.hideConfirmPassword),
                    child: _data.hideConfirmPassword
                        ? Icon(Icons.visibility_off_rounded)
                        : Icon(Icons.visibility_rounded),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * .02),
                SimpleDropDown(
                    hint: "الدخول كـ",
                    items: ['admin'],
                    value: 'admin',
                    onChanged: (value) => print('')),
                SizedBox(height: SizeConfig.screenHeight! * .04),
                DefaultButton(
                  child: MyText(
                    title: 'تسجيل',
                    color: Colors.white,
                    size: 14,
                  ),
                  onTap: () => _data.registerUser(context),
                  color: MyColors.primary,
                ),
                SizedBox(height: SizeConfig.screenHeight! * .04),
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
