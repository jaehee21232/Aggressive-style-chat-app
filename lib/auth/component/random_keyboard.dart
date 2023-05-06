import 'dart:async';
import 'dart:math';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:chatapp/auth/component/submit_button.dart';
import 'package:chatapp/auth/riverpod/state_provider.dart';
import 'package:chatapp/common/const/data.dart';
import 'package:chatapp/common/const/style/font_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomKeyBoard extends StatefulWidget {
  const RandomKeyBoard({super.key});

  @override
  State<RandomKeyBoard> createState() => _RandomKeyBoardState();
}

class _RandomKeyBoardState extends State<RandomKeyBoard> {
  late List<List> keyboardList;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyboardList = shuffleList(koreanTextList);
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        keyboardList = shuffleList(koreanTextList);
      });
    });
  }

  List<List<dynamic>> splitList(List<dynamic> list, int chunkSize) {
    List<List<dynamic>> result = [];
    for (int i = 0; i < list.length; i += chunkSize) {
      result.add(list.sublist(
          i, i + chunkSize < list.length ? i + chunkSize : list.length));
    }
    return result;
  }

  shuffleList<T>(List list) {
    var random = Random();

    for (int i = list.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1);
      T temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
    print(list);
    List<List<dynamic>> nestedList = List.generate(5, (index) => []);
    for (int i = 0; i < list.length; i++) {
      nestedList[i % 5].add(list[i]);
    }
    return nestedList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameText(StateProvider: nameTextProvider),
        SizedBox(
          height: 16,
        ),
        NameHint(
          StateProvider: nameHintProvider,
        ),
        Column(
          children: keyboardList
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: e.map((y) {
                      return _KeyboardKey(label: y, value: e);
                    }).toList(),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 16,
        ),
        SubmitTextButton(),
      ],
    );
  }
}

class _KeyboardKey extends ConsumerWidget {
  final String label;
  final dynamic value;
  const _KeyboardKey({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(nowHintProvider);
    final text = ref.watch(nameHintProvider);
    return InkWell(
      onTap: () {
        print(text);
        if (label == "C") {
          ref
              .read(nameHintProvider.notifier)
              .update((state) => state = ["", "", ""]);
          ref.read(nowHintProvider.notifier).update((state) => state = 0);
        } else if (now == 0) {
          if (label == "D") {
            ref
                .read(nameTextProvider.notifier)
                .update((state) => state = ["류", "재", "희"]);
          } else {
            ref.read(nameHintProvider.notifier).update((state) => state = [
                  label.toString(),
                  text[1].toString(),
                  text[2].toString()
                ]);
            ref.read(nowHintProvider.notifier).update((state) => state = 1);
          }
        } else if (now == 1) {
          if (label == "D") {
            ref
                .read(nameTextProvider.notifier)
                .update((state) => state = ["류", "재", "희"]);
          } else {
            ref.read(nameHintProvider.notifier).update((state) => state = [
                  text[0].toString(),
                  label.toString(),
                  text[2].toString()
                ]);
            ref.read(nowHintProvider.notifier).update((state) => state = 2);
          }
        } else if (now == 2) {
          if (label == "D") {
            ref
                .read(nameTextProvider.notifier)
                .update((state) => state = ["류", "재", "희"]);
          } else {
            ref.read(nameHintProvider.notifier).update((state) => state = [
                  text[0].toString(),
                  text[1].toString(),
                  label.toString(),
                ]);
            ref.read(nowHintProvider.notifier).update((state) => state = 0);
          }
        }
      },
      child: Container(
          child: Center(
        child: Text(
          label.toString(),
          style: styleDialogText,
        ),
      )),
    );
  }
}

class NameHint extends ConsumerWidget {
  final StateProvider;

  const NameHint({super.key, required this.StateProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(StateProvider);
    final count = ref.watch(nowHintProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: count == 0 ? Colors.red : Colors.white)),
          child: Text(
            text[0],
            style: titleText,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: count == 1 ? Colors.red : Colors.white)),
          child: Text(
            text[1],
            style: titleText,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: count == 2 ? Colors.red : Colors.white)),
          child: Text(
            text[2],
            style: titleText,
          ),
        ),
      ],
    );
  }
}

class NameText extends ConsumerWidget {
  final StateProvider;

  const NameText({super.key, required this.StateProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(StateProvider);
    final count = ref.watch(nowNameProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: count == 0 ? Colors.red : Colors.white)),
          child: Text(
            text[0],
            style: titleText,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: count == 1 ? Colors.red : Colors.white)),
          child: Text(
            text[1],
            style: titleText,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: count == 2 ? Colors.red : Colors.white)),
          child: Text(
            text[2],
            style: titleText,
          ),
        ),
      ],
    );
  }
}

class SubmitTextButton extends ConsumerWidget {
  const SubmitTextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(nowNameProvider);
    final name = ref.watch(nameTextProvider);
    final hint = ref.watch(nameHintProvider);
    return SubmitButton(
        onPressed: () {
          try {
            if (now == 0) {
              ref.read(nameTextProvider.notifier).update((state) => state = [
                    implode("${hint[0]}${hint[1]}${hint[2]}")
                        .replaceAll(RegExp('[^a-zA-Z0-9가-힣\\s]'), ""),
                    name[1],
                    name[2]
                  ]);
              ref.read(nowNameProvider.notifier).update((state) => state = 1);
            } else if (now == 1) {
              ref.read(nameTextProvider.notifier).update((state) => state = [
                    name[0],
                    implode("${hint[0]}${hint[1]}${hint[2]}")
                        .replaceAll(RegExp('[^a-zA-Z0-9가-힣\\s]'), ""),
                    name[2]
                  ]);
              ref.read(nowNameProvider.notifier).update((state) => state = 2);
            } else if (now == 2) {
              ref.read(nameTextProvider.notifier).update((state) => state = [
                    name[0],
                    name[1],
                    implode("${hint[0]}${hint[1]}${hint[2]}")
                        .replaceAll(RegExp('[^a-zA-Z0-9가-힣\\s]'), ""),
                  ]);
              ref.read(nowNameProvider.notifier).update((state) => state = 0);
            }
          } catch (e) {
            return null;
          }
        },
        child: Text(
          "완성",
          style: styleButtonText,
        ));
  }
}
