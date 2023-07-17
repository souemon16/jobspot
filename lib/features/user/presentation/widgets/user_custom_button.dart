import 'package:flutter/material.dart';

class UserCustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? fontcolor;
  final Widget buttonInterface;
  final Size? buttonSize;
  const UserCustomButton({
    Key? key,
    this.backgroundColor,
    required this.buttonInterface,
    this.buttonSize,
    this.fontcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
