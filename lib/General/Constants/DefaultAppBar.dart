import 'package:flutter/material.dart';
import 'MyColors.dart';
import 'MyText.dart';

class DefaultAppBar extends PreferredSize {
  final String title;
  // final BuildContext con;
  final Widget? leading;
  final Function? tap;
  final Color? color;
  final List<Widget>? actions;
  final Size preferredSize = const Size.fromHeight(55);

  DefaultAppBar({
    this.tap,
    required this.title,
    // required this.con,
    this.actions,
    this.color,
    this.leading,
  }) : super(preferredSize: Size.fromHeight(50), child: Container());

  @override
  Widget build(BuildContext context) {
    // var auth = context.watch<AuthCubit>().state.authorized;
    return Container(
      child: AppBar(
          title: MyText(
            title: "$title",
            size: 14,
            color: MyColors.blueBlack,
          ),
          centerTitle: true,
          backgroundColor: color ?? Colors.transparent,
          elevation: 0,
          leadingWidth: 75,
          leading: leading ??
              InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: MyColors.blueBlack
                ),
                onTap: () => Navigator.pop(context),
              ),
          actions: actions),
    );
  }
}
