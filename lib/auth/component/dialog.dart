import 'package:chatapp/common/const/color.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:flutter/material.dart';

//로그인 시도 시 누르기

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        "로그인, 회원가입을 할려면 30번\n클릭하셔야 합니다.",
        style: styleDialogText,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: black, elevation: 0),
            child: Text(
              "확인",
            ))
      ],
    );
  }
}
