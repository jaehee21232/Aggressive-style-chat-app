import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<double>((ref) => 00000000);

final loginProvider = StateProvider.autoDispose((ref) => 0);

final verificationIdProvider = StateProvider.autoDispose(
  (ref) => "",
);

final smsProvider = StateProvider.autoDispose<String>((ref) => "");

final verProvider = StateProvider((ref) => false);

final checkSmsProvider = StateProvider((ref) => false);
