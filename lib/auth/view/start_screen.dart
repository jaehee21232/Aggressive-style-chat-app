import 'package:chatapp/common/const/data.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:chatapp/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Center(
      child: Column(
        children: [
          _LogoText(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: FutureBuilder(
                future: checkLogin(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("");
                  } else {
                    return Text(snapshot.data.toString());
                  }
                },
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future<String> checkLogin() async {
    final loginData = await storage.read(key: "login");
    if (loginData == null) {
      return "회원가입";
    } else {
      return "로그인";
    }
  }
}

class _LogoText extends StatelessWidget {
  const _LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/logo/logo_dark.png",
          width: MediaQuery.of(context).size.width / 2.5,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "CHAT APP",
          style: logoText,
        ),
      ],
    );
  }
}
