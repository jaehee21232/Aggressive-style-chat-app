import 'package:chatapp/auth/riverpod/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberDetailButton extends ConsumerWidget {
  int value;
  bool up;
  NumberDetailButton({super.key, required this.value, required this.up});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(numberProvider);
    return InkWell(
      onTap: () {
        if (up) {
          ref.watch(numberProvider.notifier).update((state) => state + value);
        } else {
          ref.watch(numberProvider.notifier).update((state) => state - value);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        child: Center(
            child: value < 10
                ? Icon(up ? Icons.arrow_forward_ios : Icons.arrow_back_ios)
                : Icon(up
                    ? Icons.keyboard_double_arrow_right
                    : Icons.keyboard_double_arrow_left)),
      ),
    );
  }
}
