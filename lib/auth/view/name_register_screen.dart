import 'dart:math';

import 'package:chatapp/auth/component/random_keyboard.dart';
import 'package:chatapp/auth/component/submit_button.dart';
import 'package:chatapp/auth/riverpod/state_provider.dart';
import 'package:chatapp/common/const/color.dart';
import 'package:chatapp/common/const/data.dart';
import 'package:chatapp/common/const/font_style.dart';
import 'package:chatapp/common/layout/default_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameRegisterScreen extends ConsumerWidget {
  const NameRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameTextProvider);
    final number = ref.watch(numberProvider);
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
                            "이름이 ${name.join()}가 맞나요?",
                            style: styleDialogText,
                            textAlign: TextAlign.center,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            SubmitButton(
                                onPressed: () {
                                  siginInWithDevice(number, name.join());
                                  Navigator.popAndPushNamed(
                                      context, "/chattingscreen");
                                },
                                child: Text(
                                  "네",
                                )),
                            SubmitButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "아니요",
                                )),
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
