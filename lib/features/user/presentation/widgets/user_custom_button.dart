import 'package:flutter/material.dart';

class UserCustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? fontcolor;
  final Widget buttonInterface;
  final Size? buttonSize;
  final void Function() ontap;
  const UserCustomButton({
    Key? key,
    this.backgroundColor,
    this.fontcolor,
    required this.buttonInterface,
    this.buttonSize,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          fixedSize: buttonSize,
          backgroundColor: backgroundColor,
          foregroundColor: fontcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: buttonInterface,
    );
  }
}
