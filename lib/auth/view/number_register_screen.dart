import 'package:chatapp/auth/component/number_detail.dart';
import 'package:chatapp/auth/component/submit_button.dart';
import 'package:chatapp/auth/riverpod/state_provider.dart';
import 'package:chatapp/common/const/color.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:chatapp/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberRegisterScreen extends ConsumerStatefulWidget {
  const NumberRegisterScreen({super.key});

  @override
  _NumberRegisterScreenState createState() => _NumberRegisterScreenState();
}

class _NumberRegisterScreenState extends ConsumerState<NumberRegisterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "회원가입",
            style: titleText,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
            ),
          )),
      body: Column(
        children: [NumberSlider()],
      ),
    );
  }
}

class NumberSlider extends ConsumerWidget {
  const NumberSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(numberProvider);
    returnNumber(String state) {
      if (state.length < 8) {
        return "${"0" * (8 - state.length)}$state";
      } else {
        return state;
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "전화번호",
          style: styleButtonText,
        ),
        Text(
          "010-${returnNumber(state.toInt().toString()).substring(0, 4)}-${returnNumber(state.toInt().toString()).substring(4, 8)}",
          style: styleDialogText,
        ),
        Slider(
          activeColor: black,
          inactiveColor: grey,
          value: state,
          max: 99999999,
          onChanged: (value) {
            ref.read(numberProvider.notifier).update((state) => state = value);
          },
        ),
        _NumberDetailButtonBox(),
        const SizedBox(
          height: 16,
        ),
        SubmitButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed("/nameregisterscreen");
            },
            child: Text(
              "확인",
              style: styleButtonText,
            ))
      ],
    );
  }
}

class _NumberDetailButtonBox extends StatelessWidget {
  const _NumberDetailButtonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NumberDetailButton(
          value: 50,
          up: false,
        ),
        NumberDetailButton(
          value: 1,
          up: false,
        ),
        NumberDetailButton(
          value: 1,
          up: true,
        ),
        NumberDetailButton(
          value: 50,
          up: true,
        )
      ],
    );
  }
}
