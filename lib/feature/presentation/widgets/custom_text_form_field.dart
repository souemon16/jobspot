import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: ColorManager.inputColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
