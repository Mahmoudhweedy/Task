import 'package:flutter/material.dart';
import 'package:task/General/Models/PaymentModel.dart';
import 'package:task/General/Resources/GetPayments.dart';

class PaymentProvider extends ChangeNotifier {
  List<PaymentModel> _payments = [];
  List<PaymentModel> get payment => _payments;
  int totalPayments = 0;
  void getPayment() async {
    _payments.clear();
    _payments = await PaymentApi().getPayments();
    countTotal();
    notifyListeners();
  }

  void countTotal() {
    _payments.forEach((element) {
      totalPayments = (totalPayments + element.amount!).round();
    });
  }

  String? dayFrom;
  String? dayTo;
  String? monthFrom;
  String? monthTo;
  String? yearFrom;
  String? yearTo;

  changeDayFrom(String newValue) {
    dayFrom = newValue;
    notifyListeners();
  }

  changeDayTo(String newValue) {
    dayTo = newValue;
    notifyListeners();
  }

  changeMonthFrom(String newValue) {
    monthFrom = newValue;
    notifyListeners();
  }

  changeMonthTo(String newValue) {
    monthTo = newValue;
    notifyListeners();
  }

  changeYearFrom(String newValue) {
    yearFrom = newValue;
    notifyListeners();
  }

  changeYearTo(String newValue) {
    yearTo = newValue;
    notifyListeners();
  }

  Future filter(String number) async {
    DateTime dateFrom = DateTime(
        int.parse(yearFrom!), int.parse(monthFrom!), int.parse(dayFrom!));
    DateTime dateTo = DateTime(
        int.parse(yearFrom!), int.parse(monthFrom!), int.parse(dayFrom!));
    _payments = await PaymentApi()
        .getFilterdPayments(dateFrom.toString(), dateTo.toString(), number);
    if (_payments.isEmpty) totalPayments = 0;
    countTotal();
    notifyListeners();
  }
}
