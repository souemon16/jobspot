import 'package:flutter/material.dart';
import 'package:jobspot/config/themes/app_color.dart';

class UserCustomField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const UserCustomField(
      {super.key,
      required this.fieldName,
      required this.obscureText,
      required this.keyboardType,
      required this.controller, 
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text(
            fieldName,
            style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.primaryColor),
          ),
        ),
        Container(
          height: 54,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColor.pureWhite,
              border: Border.all(color: AppColor.secondaryColor, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextField(

              keyboardType: keyboardType,
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration(

                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
