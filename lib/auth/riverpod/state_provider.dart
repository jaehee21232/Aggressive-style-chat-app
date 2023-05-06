import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<double>((ref) => 62533196);

final loginProvider = StateProvider.autoDispose((ref) => 0);

final verificationIdProvider = StateProvider.autoDispose(
  (ref) => "",
);

final timerProvider = StateProvider.autoDispose((ref) => 120);

final nowHintProvider = StateProvider.autoDispose(
  (ref) => 0,
);
final nameHintProvider = StateProvider<List<String>>(
  (ref) => [" ", " ", " "],
);
final nowNameProvider = StateProvider((ref) => 0);
final nameTextProvider = StateProvider<List<String>>(
  (ref) => [" ", " ", " "],
);
