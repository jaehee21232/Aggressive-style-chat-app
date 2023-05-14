import 'package:chatapp/common/const/font_style.dart';
import 'package:flutter/material.dart';

class ChoiceContainer extends StatelessWidget {
  final count;
  final text;
  const ChoiceContainer({super.key, required this.count, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: count == 0 ? Colors.red : Colors.white)),
      child: Text(
        text,
        style: titleText,
      ),
    );
  }
}
