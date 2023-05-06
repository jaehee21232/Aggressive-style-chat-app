import 'dart:math';

import 'package:chatapp/auth/component/random_keyboard.dart';
import 'package:chatapp/auth/component/submit_button.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:chatapp/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class NameRegisterScreen extends StatelessWidget {
  const NameRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: AppBar(
          title: Text(
            "이름을 골라주세요",
            style: titleText,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            RandomKeyBoard(),
            SubmitButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(child: ,);
                    },
                  );
                },
                child: Text(
                  "완료",
                  style: styleButtonText,
                ))
          ],
        ));
  }
}
