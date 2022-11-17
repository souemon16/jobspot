import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final ButtonStyle buttonStyle;
  final Widget buttonChild;
  const CustomElevatedButton({
    Key? key,
    required this.buttonStyle,
    required this.buttonChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: buttonStyle,
      child: buttonChild,
    );
  }
}

