import 'package:chatapp/common/const/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubmitButton extends StatelessWidget {
  final onPressed;
  final child;

  const SubmitButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: child);
  }
}
