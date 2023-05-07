import 'dart:math';

import 'package:chatapp/auth/component/random_keyboard.dart';
import 'package:chatapp/auth/component/submit_button.dart';
import 'package:chatapp/common/const/color.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RandomKeyBoard(),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: SubmitButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text(
                            "이름이 맞나요?",
                            style: styleDialogText,
                            textAlign: TextAlign.center,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: black, elevation: 0),
                                child: Text(
                                  "네",
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: black, elevation: 0),
                                child: Text(
                                  "아니요",
                                ))
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "완료",
                    style: styleButtonText,
                  )),
            )
          ],
        ));
  }
}
