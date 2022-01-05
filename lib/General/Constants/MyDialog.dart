import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/General/Constants/IconTextFiled.dart';
import 'package:task/General/Constants/MyColors.dart';
import 'package:task/General/Constants/MyText.dart';
import 'package:task/General/Constants/SimpleDropDown.dart';
import 'package:task/General/Constants/constants.dart';
import 'package:task/General/Providers/PaymentProvider.dart';

class MyDialog {
  BuildContext context;
  MyDialog(this.context);
  showAddItemsDialouge() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(content: FilterDialog()));
  }
}

class FilterDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .4,
      child: SingleChildScrollView(
          child: Consumer<PaymentProvider>(
        builder: (context, payment, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: 'من تاريخ',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: SimpleDropDown(
                    hint: "يوم",
                    items: days,
                    value: payment.dayFrom,
                    onChanged: (value) => payment.changeDayFrom(value),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: SimpleDropDown(
                    hint: "شهر",
                    items: months,
                    value: payment.monthFrom,
                    onChanged: (value) => payment.changeMonthFrom(value),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: SimpleDropDown(
                    hint: "سنة",
                    items: years,
                    value: payment.yearFrom,
                    onChanged: (value) => payment.changeYearFrom(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            MyText(title: 'الى تاريخ'),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: SimpleDropDown(
                    hint: "يوم",
                    items: days,
                    value: payment.dayTo,
                    onChanged: (value) => payment.changeDayTo(value),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: SimpleDropDown(
                    hint: "شهر",
                    items: months,
                    value: payment.monthTo,
                    onChanged: (value) => payment.changeMonthTo(value),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: SimpleDropDown(
                    hint: "سنة",
                    items: years,
                    value: payment.yearTo,
                    onChanged: (value) => payment.changeYearTo(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            IconTextFiled(
              controller: _controller,
              type: TextInputType.phone,
              suffix: Icon(Icons.phone_iphone),
            ),
            Divider(thickness: 2),
            ElevatedButton(
              onPressed: ()  =>  payment.filter(_controller.text).then((value) => Navigator.pop(context)),
              child: MyText(
                title: "بحث",
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 30),
                primary: MyColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
