import 'package:easy_localization/easy_localization.dart';

class Validator {
  String fillFields = tr("fillField");
  String passWordValidate = tr("passValidation");
  String mailValidation = tr("mailValidation");
  String phoneValidation = tr("phoneValidation");
  String confirmPassword = tr("confirmValidation");
  String noValidate({required String value}) {
    return "ok";
  }

  String? validateEmpty({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
  }

  String? validatePassword({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    } else if (value.length < 8) {
      return message ?? passWordValidate;
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&^*~]).{8,}$')
        .hasMatch(value)) {
      return message ?? passWordValidate;
    }
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String? validateEmail({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return message ?? mailValidation;
    }
  }

  String? validatePhone({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(value) ||
        value.length < 10) {
      return message ?? phoneValidation;
    }
  }

  String? validatePasswordConfirm(
      {required String confirm, required String pass, String? message}) {
    if (confirm.trim().isEmpty) {
      return message ?? fillFields;
    } else if (confirm != pass) {
      return message ?? confirmPassword;
    }
  }

  String? validateCode({required String code, String? message}) {
    if (code.trim().isEmpty) {
      return message ?? fillFields;
    } else if (code.length < 4) {
      return message ?? tr("codeValidation");
    }
  }
}
