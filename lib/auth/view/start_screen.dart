import 'package:chatapp/auth/component/Dialog.dart';
import 'package:chatapp/auth/riverpod/state_provider.dart';
import 'package:chatapp/common/const/color.dart';
import 'package:chatapp/common/const/data.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:chatapp/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    return DefaultLayout(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _LogoText(),
          const _LoginNumber(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: black),
              onPressed: () {
                if (state == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => LoginDialog(),
                  );
                  ref.read(loginProvider.notifier).update((state) => state + 1);
                } else if (state >= 30) {
                  Navigator.pushNamed(context, "/registerscreen");
                } else {
                  ref.read(loginProvider.notifier).update((state) => state + 1);
                }
              },
              child: FutureBuilder(
                future: checkLogin(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("");
                  } else {
                    return Text(
                      snapshot.data.toString(),
                      style: styleButtonText,
                    );
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

class _LoginNumber extends ConsumerWidget {
  const _LoginNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    return Text(
      state.toString() == "0" ? "" : state.toString(),
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }
}
