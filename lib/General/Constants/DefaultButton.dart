import 'package:flutter/material.dart';
import 'package:task/General/utilities/SizeConfig.dart';

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  Widget child;
  Function onTap;
  Color? color;
  EdgeInsets? margin = EdgeInsets.all(0);
  DefaultButton(
      {required this.child, required this.onTap, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: SizeConfig.screenHeight! * .065,
        // padding: EdgeInsets.symmetric(vertical: 20),
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
