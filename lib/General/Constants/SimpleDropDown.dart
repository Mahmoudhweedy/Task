import 'package:task/General/constants/MyColors.dart';
import 'package:task/General/constants/MyText.dart';
import 'package:task/General/constants/constants.dart';
import 'package:flutter/material.dart';

class SimpleDropDown extends StatelessWidget {
  const SimpleDropDown({
    Key? key,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String hint;
  final List<String> items;
  final String? value;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: kBoxShadow2,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.primary, width: .5)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: DropdownButton<String>(
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyText(
            title: hint,
            color: MyColors.blueBlack,
            fontWeight: FontWeight.w300,
            size: 12,
          ),
        ),
        underline: const SizedBox(),
        value: value,
        isDense: true,
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        isExpanded: true,
        dropdownColor: Colors.white,
        items: items.map((item) {
          return (DropdownMenuItem(
            child: Text(
              item,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
            ),
            value: item,
          ));
        }).toList(),
        onChanged: (newValue) => onChanged(newValue!),
      ),
    );
  }
}
