import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    Key? key,
    required this.checkedValue,
  }) : super(key: key);

  final bool? checkedValue;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CheckboxListTile(
        title: const Text(
          "Remember me",
          style: TextStyle(fontSize: 10),
        ),
        value: checkedValue,
        contentPadding: const EdgeInsets.all(0),
        onChanged: (newValue) {},
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
