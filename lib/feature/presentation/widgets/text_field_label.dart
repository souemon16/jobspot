import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  final String fieldName;
  const TextFieldLabel({
    Key? key,
    required this.fieldName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        fieldName,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
    );
  }
}
