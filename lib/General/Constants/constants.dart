import 'package:flutter/material.dart';

const List<BoxShadow> kBoxShadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    spreadRadius: 6,
    offset: Offset(0, 2),
  )
];
const List<BoxShadow> kBoxShadow2 = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    spreadRadius: 1,
    offset: Offset(2, 6),
  )
];

const Duration myDuration = Duration(milliseconds: 750);

List<String> days = List.generate(31, (index) => '${(index + 1)}');
List<String> months = List.generate(12, (index) => '${(index + 1)}');
const List<String> years = ['2018', '2019', '2020', '2021', '2022'];
